//
//  Endpoint.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 26/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    
    
    var apiKey: String {
        return "api_key=4A0863B77CDA66EAE18095E1947048D9"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum YesplanCases {
    
    case events
    case tasks
    case statuses
}

extension YesplanCases: Endpoint {
    
    var base: String {
        return "https://dewerft.yesplan.be"
    }
    
    var path: String {
        switch self {
        case .events: return "/api/events/event:date:\(selectedDateString) TO \(selectedEndDateString) event:status:bevestigd" // &3Adate&3A13-04-2018%20TO%2023-04-2018" //\(selectedDateString)TO\(selectedEndDateString) event:status:bevestigd"
        case .tasks: return "/api/tasks"
        case .statuses: return "/api/statuses"
        }
    }
    
//    var query: String {
//        switch self {
//        case .events: return "/api/events/event&3Adate&3A13-04-2018%20TO%2023-04-2018" //\(selectedDateString)TO\(selectedEndDateString) event:status:bevestigd"
//        case .tasks: return "/api/tasks"
//        case .statuses: return "/api/statuses"
//        }
//    }
}

