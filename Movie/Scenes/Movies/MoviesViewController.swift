//
//  MoviesViewController.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.


import UIKit

protocol MoviesDisplayLogic: class {
    func displayPopularMovies(viewModel: Movies.ViewModel)
}

final class MoviesViewController: LayoutingViewController, MoviesDisplayLogic {
    
    typealias ViewType = MoviesView
    
    var interactor: MoviesBusinessLogic?
    var router: (NSObjectProtocol & MoviesRoutingLogic & MoviesDataPassing)?
    
    var movies: [MovieItemCellModel] {
        get {
            guard let searchText = layoutableView.searchBar.text, !searchText.isEmpty else {
                return moviesFiltered
            }
            let movies = self.moviesFiltered.filter{ item  in
                return item.title.lowercased().contains(searchText.lowercased())
            }
            return movies
        }
    }
    var moviesFiltered: [MovieItemCellModel] = []
    var listType: ListType = .grid
    
    static func builder() -> MoviesViewController {
        let viewController = MoviesViewController()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter()
        let router = MoviesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
    
    // MARK: View lifecycle
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutableView.searchBar.delegate = self
        layoutableView.collectionView.delegate = self
        layoutableView.collectionView.dataSource = self
        layoutableView.listTypeButton.addTarget(self, action: #selector(changeListType), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.numberOfTapsRequired = 1
        layoutableView.addGestureRecognizer(tap)
        interactor?.fetchPopularMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    func displayPopularMovies(viewModel: Movies.ViewModel) {
        
        let previousCount = self.movies.count
        self.moviesFiltered += viewModel.movies
        let newItemCounts = viewModel.movies.count
        
        if newItemCounts > 0 {
            var indexPaths: [IndexPath] = []
            for i in 0...viewModel.movies.count-1 {
                indexPaths.append(IndexPath(row: previousCount+i, section: 0))
            }
            layoutableView.collectionView.performBatchUpdates({
                layoutableView.collectionView.insertItems(at: indexPaths)
            }, completion: nil)
            
        }
    }
}

//Actions
extension MoviesViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func changeListType() {
        layoutableView.listTypeButton.setImage( listType == .grid ? #imageLiteral(resourceName: "list") : #imageLiteral(resourceName: "grid"), for: .normal)
        listType = listType == .grid ? .list : .grid
        layoutableView.collectionView.reloadData()
    }
}
