//
//  MoviesInteractorTests.swift
//  MovieTests
//
//  Created by Alican Aycil on 15.01.2021.
//

import XCTest
@testable import Movie

class MoviesInteractorTests: XCTestCase {
    
    var sut: MoviesInteractor!
    
    override func setUp() {
        sut = MoviesInteractor()
    }
    
    class MoviesPresentationLogicSpy: MoviesPresentationLogic {
        
        var presentPopularMoviesCalled = false
        
        func presentPopularMovies(response: Movies.Response) {
            presentPopularMoviesCalled = true
        }
    }
    
    func test_fetchMovies() {
        
        let spy = MoviesPresentationLogicSpy()
        sut.presenter = spy
        
        let predicate = NSPredicate(block: {any, _ in
            guard let spy = any as? MoviesPresentationLogicSpy else{
                return false
            }
            return spy.presentPopularMoviesCalled
        })
        _ = self.expectation(for: predicate, evaluatedWith: spy, handler: .none)
        
        sut.fetchPopularMovies()
        
        waitForExpectations(timeout: 20, handler: .none)
        XCTAssertTrue(spy.presentPopularMoviesCalled)
    }
}
