//
//  EventStatusesResult.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 27/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

public struct StatusesResult: Decodable {
    let pagination: Pagination
    let data: [Status]
//    let url: String?
}
