//
//  MoviewListViewController.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import UIKit


// MARK: Lifecycle
class MoviesListViewController: UIViewController, MoviesListViewInput {
  var output: MoviesListViewOutput?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.output?.didTriggerViewReadyEvent()
    self.output?.setViewForSetup(view: self.view)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.getFilmWithCallback { (film) in
      self.output?.setData(film: film)
    }
  }
  
}

// MARK: MoviesListViewInput
extension MoviesListViewController {
  func setUpInitialState() {
    self.navigationItem.title = "RootViewController"
    self.view.backgroundColor = UIColor.white
  }
}
