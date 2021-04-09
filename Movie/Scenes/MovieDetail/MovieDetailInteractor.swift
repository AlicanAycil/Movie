//
//  MovieDetailInteractor.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.

import UIKit

protocol MovieDetailBusinessLogic {
    func fetchMovieDetail()
}

protocol MovieDetailDataStore {
    var movieId: Int { get set }
}

class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore {
    
    var presenter: MovieDetailPresentationLogic?
    var worker: MovieDetailWorker?
    var movieId: Int = 0
    
    func fetchMovieDetail() {
        LoadingViewUtility.showLoadingView()
        let request = MovieDetail.Request(movieId: movieId)
        worker = MovieDetailWorker(moviesStore: MovieDetailApi())
        worker?.fetchMovieDetail(request: request, completionHandler: { [weak self] (result) in
            LoadingViewUtility.hideLoadingView()
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.presentMovieDetail(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
