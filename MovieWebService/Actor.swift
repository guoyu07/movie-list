//
//  Actor.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

class Actor: GenericRole {
  var screenName: String?
}

// MARK: Initialisation
extension Actor {
  convenience init(data: Dictionary<String, Any>) {
    self.init()
    self.screenName = data["screenName"] as? String
  }
}
