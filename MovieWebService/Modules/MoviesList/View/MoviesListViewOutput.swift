//
//  MovieListViewOutput.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

protocol MoviesListViewOutput {
  func didTriggerViewReadyEvent()
  func setViewForSetup(view: UIView)
  func setData(film: Film)
}
