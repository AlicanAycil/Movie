//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.

import UIKit

protocol MovieDetailDisplayLogic: class {
    func displayMovieDetail(viewModel: MovieDetail.ViewModel)
}

class MovieDetailViewController: LayoutingViewController, MovieDetailDisplayLogic {
    
    typealias ViewType = MovieDetailView
    
    var interactor: MovieDetailBusinessLogic?
    var router: (NSObjectProtocol & MovieDetailRoutingLogic & MovieDetailDataPassing)?
    
    
    static func builder() -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter()
        let router = MovieDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movie Detail"
        interactor?.fetchMovieDetail()
    }
    
    func displayMovieDetail(viewModel: MovieDetail.ViewModel) {
        layoutableView.configureUI(movieDetailItem: viewModel.movieDetailItem)
    }
}
