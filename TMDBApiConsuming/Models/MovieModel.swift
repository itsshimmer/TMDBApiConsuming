//
//  MovieModel.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 01/07/21.
//

import Foundation
//import UIKit

struct Movie {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
//    var poster: UIImage?
}

struct MovieParser {
    
//    let tmdbApi: TMDBAPI = TMDBAPI()
    
    func parseMovieDictionary(dictionary: [String: Any]) -> Movie? {
        guard let adult = dictionary["adult"] as? Bool,
              let backdrop_path = dictionary["backdrop_path"] as? String,
              let genre_ids = dictionary["genre_ids"] as? [Int],
              let id = dictionary["id"] as? Int,
              let original_language = dictionary["original_language"] as? String,
              let original_title = dictionary["original_title"] as? String,
              let overview = dictionary["overview"] as? String,
              let popularity = dictionary["popularity"] as? Double,
              let poster_path = dictionary["poster_path"] as? String,
              let release_date = dictionary["release_date"] as? String,
              let title = dictionary["title"] as? String,
              let video = dictionary["video"] as? Bool,
              let vote_average = dictionary["vote_average"] as? Double,
              let vote_count = dictionary["vote_count"] as? Int
        else {
            return nil
        }
        
//        tmdbApi.requestMoviePoster(completionHandler: { result in
//            let poster = result
//        }, poster_path: poster_path)

        return Movie(adult: adult, backdrop_path: backdrop_path, genre_ids: genre_ids, id: id, original_language: original_language, original_title: original_title, overview: overview, popularity: popularity, poster_path: poster_path, release_date: release_date, title: title, video: video, vote_average: vote_average, vote_count: vote_count)
        
        
    }
    
}
