//
//  MoviesPresenterTests.swift
//  MovieTests
//
//  Created by Alican Aycil on 15.01.2021.
//

import XCTest
@testable import Movie

class MoviesPresenterTests: XCTestCase {
    
    var sut: MoviesPresenter!

    override func setUp() {
        sut = MoviesPresenter()
    }
    
    class MoviesDisplayLogicSpy: MoviesDisplayLogic {
        
        var displayPopularMoviesCalled = false
        
        func displayPopularMovies(viewModel: Movies.ViewModel) {
            displayPopularMoviesCalled = true
        }
    }

    func test_presentMovies() {
        
        let spy = MoviesDisplayLogicSpy()
        sut.viewController = spy
        
        let movieItem = Movies.Response.MovieItem(id: 0,
                                                  title: "",
                                                  posterPath: "")
        let response = Movies.Response(page: 0, results: [movieItem])
        
        sut.presentPopularMovies(response: response)
        
        XCTAssertTrue(spy.displayPopularMoviesCalled)
    }

}
