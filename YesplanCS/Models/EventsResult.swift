//
//  EventsResult.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 27/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct EventsResult: Decodable {
    let pagination: Pagination
    let data: [Event]
    
}


