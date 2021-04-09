//
//  MovieDetailRouter.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.

import UIKit

@objc protocol MovieDetailRoutingLogic {}

protocol MovieDetailDataPassing {
  var dataStore: MovieDetailDataStore? { get }
}

class MovieDetailRouter: NSObject, MovieDetailRoutingLogic, MovieDetailDataPassing {
    
  weak var viewController: MovieDetailViewController?
  var dataStore: MovieDetailDataStore?

}
