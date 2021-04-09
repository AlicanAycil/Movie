//
//  MovieDetailPresenter.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.

import UIKit

protocol MovieDetailPresentationLogic {
    func presentMovieDetail(response: MovieDetail.Response)
}

final class MovieDetailPresenter: MovieDetailPresentationLogic {
    
    weak var viewController: MovieDetailDisplayLogic?
    
    func presentMovieDetail(response: MovieDetail.Response) {
        
        let movieDetailItem: MovieDetailItem = MovieDetailItem(title: response.title,
                                                                   overview: response.overview,
                                                                   posterPath: URL(string: MoviesImage.w500.path+response.posterPath),
                                                                   voteCount: "Vote Count: \(response.voteCount)")
        viewController?.displayMovieDetail(viewModel: MovieDetail.ViewModel(movieDetailItem: movieDetailItem))
    }
    
}
