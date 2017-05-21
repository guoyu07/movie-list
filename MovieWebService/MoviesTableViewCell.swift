//
//  MoviesTableViewCell.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 13/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var date: UILabel!
  @IBOutlet weak var rating: UILabel!
  @IBOutlet weak var filmRating: UILabel!

  func setUp(film: Film) -> Void {
  
  }
}
