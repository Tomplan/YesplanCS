//
//  MovieFeedResult.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 26/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct MovieFeedResult: Decodable {
    let pagination: Pagination
    let data: [Event]?
}

