//
//  MovieClient.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 26/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

class YesplanClient: APIClient {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    //in the signature of the function in the success case we define the Class type thats is the generic one in the API

    func getData(from yesplanType: YesplanCases, completion: @escaping (Result<YesplanResult?, APIError>) -> Void) {
        let endpoint = yesplanType
        let request = endpoint.request
//        print("request: ", request)
        
        fetch(with: request, decode: { json -> YesplanResult? in
            guard let yesplanResult = json as? YesplanResult else { return  nil }
            return yesplanResult
        }, completion: completion)
    }
 
}
