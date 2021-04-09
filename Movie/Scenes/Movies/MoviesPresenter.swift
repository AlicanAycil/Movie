//
//  MoviesPresenter.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.


import UIKit

protocol MoviesPresentationLogic {
    func presentPopularMovies(response: Movies.Response)
}

final class MoviesPresenter: MoviesPresentationLogic {
    weak var viewController: MoviesDisplayLogic?
    
    func presentPopularMovies(response: Movies.Response) {
        
        let cells: [MovieItemCellModel] = response.results.map { (movieItem) -> MovieItemCellModel in
            
            let moviesTableViewCell: MovieItemCellModel = MovieItemCellModel(id: movieItem.id,
                                                                             title: movieItem.title,
                                                                             posterFullPath: URL(string: MoviesImage.w500.path+movieItem.posterPath))
            return moviesTableViewCell
        }
        
        let viewModel = Movies.ViewModel(movies: cells)
        
        viewController?.displayPopularMovies(viewModel: viewModel)
    }
    
}
