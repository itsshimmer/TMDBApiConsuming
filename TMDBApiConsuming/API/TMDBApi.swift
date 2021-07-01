//
//  TMDBApiController.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 01/07/21.
//

import Foundation

let APIKey: String = "171ea8ef33bff26411439b2fe3e357c9"
let language: String = "en-US"

struct MovieParser {
    
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
        return Movie(adult: adult, backdrop_path: backdrop_path, genre_ids: genre_ids, id: id, original_language: original_language, original_title: original_title, overview: overview, popularity: popularity, poster_path: poster_path, release_date: release_date, title: title, video: video, vote_average: vote_average, vote_count: vote_count)
    }
    
}

struct TMDBAPI {
    
    func getPopularMovies(completionHandler: @escaping ([Movie]) -> Void) {
    
        // Request URL
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey)&language=\(language)&page=1")!
        
        print(url)
        //
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Assures data and serialization
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                  let movieArray = json["results"] as? [Movie]
            else {
                completionHandler([])
                return
            }
            print(movieArray)
            completionHandler([])
        }
        .resume()
        
    }
    
}
