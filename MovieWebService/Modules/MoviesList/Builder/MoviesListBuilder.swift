//
//  MoviesListBuilder.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

class MoviesListBuilder: NSObject {
  func build() -> UIViewController {
    let viewController = MoviesListViewController()
    let router = MoviesListRouter()
    router.viewController = viewController
    
    let presenter = MoviesListPresenter()
    presenter.view = viewController
    presenter.router = router
    
    let interactor = MoviesListInteractor()
    interactor.output = presenter
    presenter.interactor = interactor
    viewController.output = presenter
    
    return viewController
  }
}
