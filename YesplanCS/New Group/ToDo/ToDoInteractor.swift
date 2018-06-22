//
//  ToDoInteractor.swift
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

protocol ToDoBusinessLogic
{
  func doSomething(request: ToDo.Something.Request)
}

protocol ToDoDataStore
{
  //var name: String { get set }
}

class ToDoInteractor: ToDoBusinessLogic, ToDoDataStore
{
  var presenter: ToDoPresentationLogic?
  var worker: ToDoWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ToDo.Something.Request)
  {
    worker = ToDoWorker()
    worker?.doSomeWork()
    
    let response = ToDo.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
