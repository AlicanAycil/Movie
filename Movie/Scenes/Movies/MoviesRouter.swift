//
//  MoviesRouter.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.


import UIKit

@objc protocol MoviesRoutingLogic {
    func routeToMovieDetailViewController(id: Int)
}

protocol MoviesDataPassing {
  var dataStore: MoviesDataStore? { get }
}

class MoviesRouter: NSObject, MoviesRoutingLogic, MoviesDataPassing {
    
  weak var viewController: MoviesViewController?
  var dataStore: MoviesDataStore?
  
    func routeToMovieDetailViewController(id: Int) {
        let controller = MovieDetailViewController.builder()
        var dataStore = controller.router?.dataStore
        passDataToMovieDetail(destination: &dataStore, id: id)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func passDataToMovieDetail(destination: inout MovieDetailDataStore?, id: Int) {
        destination?.movieId = id
    }
}
