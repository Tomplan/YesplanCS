//
//  Task.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 29/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Task: Codable {
    
    let url: String?
    let id: String?
//    let owner: User_Id?
//    let owningteam: Usergroup_Id?
//    let owninggroup: Usergroup_Id?
    let status: String
    let name: String?
    let team: String
    let cost: Int
    let due: String? //timestamp
    let start: String? //timestamp
    let description: String?
//    let event: TaskEvent?    //
    let assignedby: String?
    let assignedto: String?
    let duration: String?
}
