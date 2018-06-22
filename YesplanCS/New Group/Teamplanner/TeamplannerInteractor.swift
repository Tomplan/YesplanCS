//
//  TeamplannerInteractor.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 24/03/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TeamplannerBusinessLogic
{
  func doSomething(request: Teamplanner.Something.Request)
}

protocol TeamplannerDataStore
{
  //var name: String { get set }
}

class TeamplannerInteractor: TeamplannerBusinessLogic, TeamplannerDataStore
{
  var presenter: TeamplannerPresentationLogic?
  var worker: TeamplannerWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Teamplanner.Something.Request)
  {
    worker = TeamplannerWorker()
    worker?.doSomeWork()
    
    let response = Teamplanner.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
