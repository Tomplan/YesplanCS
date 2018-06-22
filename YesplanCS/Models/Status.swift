//
//  EventStatus.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 27/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Status: Codable {
    
    let url: String?
    let _type = "status"
    let name: String?
    let backgroundcolor: String?
    let textcolor: String
    let statustypes: [String]
}
