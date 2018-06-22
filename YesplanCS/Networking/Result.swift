//
//  Result.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 26/03/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
