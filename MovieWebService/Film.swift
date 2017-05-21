//
//  SFilm.swift
//  MovieWebService
//
//  Created by Swaminathan Nagarajan on 01/05/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

class Film : NSObject {
  var nominated: Bool?
  var filmRating: FilmRating?
  var languages: Array<String>?
  var releaseDate: Date?
  var cast: Array<Actor>?
  var name: String?
  var rating: Double?
  var director: Director?
}

// MARK: Load methods

extension Film {
  convenience init(data: Dictionary<String, Any>) {
    self.init();
    self.filmRating = data["filmRating"] as? FilmRating
    self.languages = data["languages"] as? Array<String>
    self.nominated = data["nominated"] as? Bool
    self.releaseDate = Date(timeIntervalSince1970: TimeInterval(Double(data["releaseDate"] as! Int)))
  
    self.name = data["name"] as? String
    self.rating = data["rating"] as? Double
    self.director = Director(data: data["director"] as! Dictionary<String, Any>)
    let castData = data["casts"] as? Array<Dictionary<String, Any>>
    cast = []
    if let _ = castData {
      for cData in castData! {
        let actor = Actor(data: cData);
        actor.film = self
        cast?.append(actor)
      }
    }
  }
}
