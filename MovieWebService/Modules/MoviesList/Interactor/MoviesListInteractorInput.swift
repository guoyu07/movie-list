//
//  MoviesListInteractorInput.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

protocol MoviesListInteractorInput {
  func setViewForSetup(view: UIView) -> Void
  func setData(films: Array<Film>) -> Void
}
