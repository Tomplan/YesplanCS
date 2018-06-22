//
//  UserInteractor.swift
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

protocol UserBusinessLogic
{
  func doSomething(request: User.Something.Request)
}

protocol UserDataStore
{
  //var name: String { get set }
}

class UserInteractor: UserBusinessLogic, UserDataStore
{
  var presenter: UserPresentationLogic?
  var worker: UserWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: User.Something.Request)
  {
    worker = UserWorker()
    worker?.doSomeWork()
    
    let response = User.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
