//
//  MoviesApi.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import Foundation

final class MoviesApi: MoviesStoreProtocol {

    var networkManager: NetworkManager
    var cancelableRequests: [CancelableSessionProtokol]?
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchPopularMovies(request: Movies.Request, completionHandler: @escaping (Result<Movies.Response, NetworkError>) -> Void) {

        let parameters = ["api_key": request.apiKey,
                          "language": request.language,
                          "page": String(request.page)]
        let apiRequest = ApiRequest<MovieEndpoint>(httpMethod: .get, path: request.popularMoviesUrl, parameters: parameters)
        
        let cancelable = networkManager.loadData(urlRequest: apiRequest, responseModel: Movies.Response.self) { (result) in
            completionHandler(result)
        }
        
        cancelableRequests?.append(cancelable)
    }
    
    deinit {
        cancelableRequests?.forEach{ $0.cancel() }
    }
}
