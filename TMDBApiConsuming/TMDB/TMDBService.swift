//
//  TMDBService.swift
//  TMDBApiConsuming
//
//  Created by João Brentano on 01/07/21.
//

import Foundation

struct TMDBService {
    
    let TMDBApi: TMDBAPI = TMDBAPI()
    let movieParser: MovieParser = MovieParser()
    
    func getPopularMovies(completionHandler: @escaping  ([Movie]) -> Void) {
        TMDBApi.requestPopularMovies { (moviesDictionary) in
            let movies = moviesDictionary.compactMap { movieParser.parseMovieDictionary(dictionary: $0) }
            completionHandler(movies)
        }
    }
    
}
