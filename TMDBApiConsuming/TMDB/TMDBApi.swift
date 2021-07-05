//
//  TMDBApiController.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 01/07/21.
//

import Foundation
import UIKit

let APIKey: String = "171ea8ef33bff26411439b2fe3e357c9"
let language: String = "en-US"

struct TMDBAPI {
    
    typealias WebMovie = [String:Any]
    
    func requestMoviePoster(completionHandler: @escaping (UIImage) -> Void, poster_path: String) {
        
        // Request URL
        let url: URL = URL(string: "https://image.tmdb.org/t/p/original\(poster_path)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Assures data and image
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else {
                completionHandler(UIImage())
                return
            }
            completionHandler(image)
        }
        .resume()
    }
    
    func requestPopularMovies(completionHandler: @escaping ([[String:Any]]) -> Void, page: Int) {
    
        // Request URL
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey)&language=\(language)&page=\(page)")!
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
    
    func requestNowPlaying(completionHandler: @escaping ([[String:Any]]) -> Void, page: Int) {
    
        // Request URL
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIKey)&language=\(language)&page=\(page)")!
        
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
    
    //TO DO: QUERY
    func requestSearch(completionHandler: @escaping ([[String:Any]]) -> Void, query: String, page: Int, include_adult: Bool) {
    
        // Request URL
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(APIKey)&language=\(language)&page=\(page)&include_adult=\(include_adult)")!
        
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
    
    func requestGenres(completionHandler: @escaping ([[String:Any]]) -> Void) {
    
        // Request URL
        let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKey)&language=\(language)")!
        
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
