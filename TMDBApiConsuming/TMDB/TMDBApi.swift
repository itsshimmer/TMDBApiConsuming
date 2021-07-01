//
//  TMDBApiController.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 01/07/21.
//

import Foundation

let APIKey: String = "171ea8ef33bff26411439b2fe3e357c9"
let language: String = "en-US"

struct TMDBAPI {
    
    func requestPopularMovies(completionHandler: @escaping ([[String:Any]]) -> Void) {
    
        // Request URL
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey)&language=\(language)&page=1")!
        
        typealias WebMovie = [String:Any]
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Assures data and serialization
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                  let movieDictionary = json["results"] as? [WebMovie]
            else {
                completionHandler([])
                return
            }
            completionHandler(movieDictionary)
        }
        .resume()
        
    }
    
}
