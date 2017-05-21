//
//  AppDelegate.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var navigationController: UINavigationController!
  
  func applicationDidFinishLaunching(_ application: UIApplication) {
    let firstBuilder = MoviesListBuilder()
    let viewController = firstBuilder.build()
    self.navigationController = UINavigationController()
    var vcArray: [UIViewController] = []
    vcArray.append(viewController)
    self.navigationController.viewControllers = vcArray
    self.window?.rootViewController = self.navigationController
    self.window?.makeKeyAndVisible()
  }
  
  func getFilmWithCallback(callback: @escaping (_ film:Film)->()) -> Void {
    DispatchQueue.global().async() {
      let data: [String: Any] = ["filmRating": 3,
                              "languages": ["English", "Thai"],
                              "nominated": true,
                              "releaseDate": 1350000000,
                              "cast": [
                                [
                                  "dateOfBirth": -436147200,
                                  "nominated": 1,
                                  "name": "Bryan Cranston",
                                  "screenName": "Jack Donnell",
                                  "biography": "Bryan Lee Cranston is an American actor, voice actor, writer and director."
                                ]
        ],
                              "name": "Argo",
                              "rating": 7.8,
                              "director": [
                                "dateOfBirth": 82684800,
                                "nominated": 1,
                                "name": "Ben Affleck",
                                "biography": "Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
        ]
      ]
      let film = Film(data: data)
      callback(film)
    }
  }
}
