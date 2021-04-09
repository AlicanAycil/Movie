//
//  MoviesViewControllerTests.swift
//  MovieTests
//
//  Created by Alican Aycil on 15.01.2021.
//

import XCTest
@testable import Movie

class MoviesViewControllerTests: XCTestCase {
    
    var sut: MoviesViewController!
    
    override func setUp() {
        super.setUp()
        sut = MoviesViewController()
    }
    
    class MoviesBusinessLogicSpy: MoviesBusinessLogic {
        
        var fetchPopularMoviesCalled = false
        
        func fetchPopularMovies() {
            fetchPopularMoviesCalled = true
        }
    }
    
    class MoviesRoutingLogicSpy: NSObject, MoviesRoutingLogic, MoviesDataPassing {
        
        var dataStore: MoviesDataStore?
        var routeToMovieDetailViewControllerCalled = false
        
        func routeToMovieDetailViewController(id: Int) {
            routeToMovieDetailViewControllerCalled = true
        }
    }
    
    func test_viewIsviewDidLoad() {
        let spy = MoviesBusinessLogicSpy()
        sut.interactor = spy
        
        sut.viewDidLoad()
        
        XCTAssertTrue(spy.fetchPopularMoviesCalled)
    }
    
    func test_displayMovies() {
        
        let movieItem = MovieItemCellModel(id: 0,
                                           title: "",
                                           posterFullPath: nil)
        let viewModel = Movies.ViewModel(movies: [movieItem])
        
        let spyRouter = MoviesRoutingLogicSpy()
        sut.router = spyRouter
        let collectionView = sut.view.viewWithTag(101) as! UICollectionView
        
        sut.displayPopularMovies(viewModel: viewModel)
        sut.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
        
        
        XCTAssertTrue(spyRouter.routeToMovieDetailViewControllerCalled)
        
        XCTAssert(
            sut.collectionView(collectionView, numberOfItemsInSection: 0) > 0
        )
        
        XCTAssertNotNil(
            sut.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        )
    }
}
