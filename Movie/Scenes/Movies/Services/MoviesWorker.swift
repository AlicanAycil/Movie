//
//  MoviesWorker.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.


import UIKit

protocol MoviesStoreProtocol {
    func fetchPopularMovies(request: Movies.Request, completionHandler: @escaping (Result<Movies.Response, NetworkError>) -> Void)
}

final class MoviesWorker {
    
    var moviesStore: MoviesStoreProtocol
    
    init(moviesStore: MoviesStoreProtocol) {
        self.moviesStore = moviesStore
    }
    
    func fetchPopularMovies(request: Movies.Request, completionHandler: @escaping (Result<Movies.Response, NetworkError>) -> Void) {
        moviesStore.fetchPopularMovies(request: request) { (result) in
            completionHandler(result)
        }
    }
    
}
