//
//  MovieListPresenter.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 10/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListModuleInput, MoviesListViewOutput, MoviesListInteractorOutput {
  var view: MoviesListViewInput!
  var interactor: MoviesListInteractorInput!
  var router: MoviesListRouterInput!
  var films: [Film] = []
}

// MARK: MoviesListModuleInput
extension MoviesListPresenter {
  func configureModule() {
    
  }
}

// MARK: MoviesListViewOutput
extension MoviesListPresenter {
  func didTriggerViewReadyEvent() {
    self.view.setUpInitialState()
  }
  
  func setViewForSetup(view: UIView) {
    self.interactor.setViewForSetup(view: view)
  }
  
  func setData(film: Film) {
    films.append(film)
    self.interactor.setData(films: films)
  }
}
