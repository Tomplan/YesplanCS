//
//  YesplanResult.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 27/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct YesplanResult: Decodable {
    let pagination: Pagination?
    let data: [JSONValue]
    
}



