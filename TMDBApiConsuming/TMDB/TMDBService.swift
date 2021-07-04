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
    
    func getPopularMovies(completionHandler: @escaping  ([Movie]) -> Void, page: Int) {
        TMDBApi.requestPopularMovies(completionHandler: { moviesDictionary in
            let movies = moviesDictionary.compactMap { movieParser.parseMovieDictionary(dictionary: $0) }
            completionHandler(movies)
        }, page: page)
    }
    
    func getNowPlaying(completionHandler: @escaping  ([Movie]) -> Void, page: Int) {
        TMDBApi.requestNowPlaying(completionHandler: { moviesDictionary in
            let movies = moviesDictionary.compactMap { movieParser.parseMovieDictionary(dictionary: $0) }
            completionHandler(movies)
        }, page: page)
    }
    
}
