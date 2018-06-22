
//
//  TasksResult.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 29/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct TasksResult: Decodable {
    let pagination: Pagination
    let data: [Task]
}
