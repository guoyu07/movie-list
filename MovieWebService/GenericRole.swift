//
//  GenericRole.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

class GenericRole: NSObject {
  var name: String?
  var biography: String?
  var dateOfBirth: Date?
  var nominated:Bool?
  var film: Film?
}

// MARK: Initialization method
extension GenericRole {
  convenience init(data: Dictionary<String, Any>) {
    self.init()
    self.name = data["name"] as? String
    self.biography = data["biography"] as? String
    self.dateOfBirth = Date(timeIntervalSince1970: TimeInterval((Double(data["dateOfBirth"] as! Int))))
    self.nominated = data["nominated"] as? Bool
  }
}
