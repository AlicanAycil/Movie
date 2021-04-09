//
//  MoviesInteractor.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.

import UIKit

protocol MoviesBusinessLogic {
    func fetchPopularMovies()
}

protocol MoviesDataStore {}

final class MoviesInteractor: MoviesBusinessLogic, MoviesDataStore {
    
    var presenter: MoviesPresentationLogic?
    var worker: MoviesWorker?
    var page: Int = 0
    
    func fetchPopularMovies() {
        page += 1
        LoadingViewUtility.showLoadingView()
        let request = Movies.Request(page: page)
        worker = MoviesWorker(moviesStore: MoviesApi())
        worker?.fetchPopularMovies(request: request, completionHandler: { [weak self] (result) in
            LoadingViewUtility.hideLoadingView()
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.page = response.page
                self.presenter?.presentPopularMovies(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
