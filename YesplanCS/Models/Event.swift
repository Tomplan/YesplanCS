//
//  Event.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 26/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Event: Codable {
    
    let url: String
    let id: String
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let name: String?
    let group: Base? // NOT Group_Id, locations... is not transferred by Yesplan in Event_Id !?!
    let starttime: String? // timestamp Date and time of the start of the event.
    let endtime: String? // timestamp Date and time of the end of the event.
    let startdate: String? // date Date on which the start of the event appears in the calendar.
    let enddate: String? // date Date on which the end of the event appears in the calendar.
    let profile: Base? // NOT Profile_Id, color is not transferred by Yesplan in Event_Id !?!
    let status: Base? // NOT Status_Id, backgroundcolor,textcolor and statustype are not transferred by Yesplan in Event_Id !?!
    let locations: [Base]? // NOT Location_Id
    let production: Base? // null or Event_Id or Group_Id
    let isproduction: Bool
    let attributes: Pagination
    let _type = "event"
//    let labels: [JSONAny]
    let defaultscheduledescription: String?
    let defaultschedulestarttime: String? // time
    let defaultscheduleendtime: String?  // time
    let defaultschedulestart: String? // timestamp
    let defaultscheduleend: String? // timestamp
}
