//
//  MovieDetailWorker.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.

import UIKit

protocol MovieDetailStoreProtocol {
    func fetchMovieDetail(request: MovieDetail.Request, completionHandler: @escaping (Result<MovieDetail.Response, NetworkError>) -> Void)
}

final class MovieDetailWorker {
    
    var movieDetailStore: MovieDetailStoreProtocol
    
    init(moviesStore: MovieDetailStoreProtocol) {
        self.movieDetailStore = moviesStore
    }
    
    func fetchMovieDetail(request: MovieDetail.Request, completionHandler: @escaping (Result<MovieDetail.Response, NetworkError>) -> Void) {
        movieDetailStore.fetchMovieDetail(request: request) { (result) in
            completionHandler(result)
        }
    }
    
}
