//
//  ContactsInteractor.swift
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

protocol ContactsBusinessLogic
{
  func doSomething(request: Contacts.Something.Request)
}

protocol ContactsDataStore
{
  //var name: String { get set }
}

class ContactsInteractor: ContactsBusinessLogic, ContactsDataStore
{
  var presenter: ContactsPresentationLogic?
  var worker: ContactsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Contacts.Something.Request)
  {
    worker = ContactsWorker()
    worker?.doSomeWork()
    
    let response = Contacts.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
