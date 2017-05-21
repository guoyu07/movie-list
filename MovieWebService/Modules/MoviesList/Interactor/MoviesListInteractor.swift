//
//  MoviesListInteractor.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 07/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import Foundation

class MoviesListInteractor: NSObject, MoviesListInteractorInput, UITableViewDataSource, UITableViewDelegate {
  var output: MoviesListInteractorOutput!
  var movieCell: MoviesTableViewCell!
  var tableView: UITableView!
  var films: Array<Film> = []
  var view: UIView?
  let cellIdentifier = "MoviesTableViewCell"
}


// MARK: MoviesListInteractorInput

extension MoviesListInteractor {
  func setViewForSetup(view: UIView) {
    self.view = view
    tableView = UITableView()
    self.view?.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func setData(films: Array<Film>) {
    self.films = films
    tableView?.reloadData()
  }
}

// MARK: Table view delegates
extension MoviesListInteractor {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return films.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MoviesTableViewCell
    if let _ = cell {
      cell = Bundle.main.loadNibNamed(cellIdentifier, owner: self, options: nil)?.first as? MoviesTableViewCell
    }
    let film = films[indexPath.row]
    cell?.name.text = film.name!
    
    let cal = Calendar.current
    let formatter = DateFormatter()
    formatter.calendar = cal
    cell?.date.text = formatter.string(from: film.releaseDate!)
    
    switch film.filmRating! {
    case .G:
      cell?.filmRating.text = "G"
      break
    case .PG:
      cell?.filmRating.text = "PG"
      break
    case .PG13:
      cell?.filmRating.text = "PG13"
      break
    case .R:
      cell?.filmRating.text = "R"
    default:
      break
    }
    cell?.rating.text = "\(String(describing: film.rating))"
    
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let appDel = UIApplication.shared.delegate as? AppDelegate
    let film = films[indexPath.row]
    let builder = DetailsModuleBuilder()
    appDel?.navigationController.pushViewController(builder.build(with: film), animated: true)
  }
}
