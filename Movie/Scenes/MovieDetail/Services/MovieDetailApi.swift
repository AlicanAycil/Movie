//
//  MovieDetailApi.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.
//

import Foundation

final class MovieDetailApi: MovieDetailStoreProtocol {

    var networkManager: NetworkManager
    var cancelableRequests: [CancelableSessionProtokol]?
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchMovieDetail(request: MovieDetail.Request, completionHandler: @escaping (Result<MovieDetail.Response, NetworkError>) -> Void) {

        let parameters = ["api_key": request.apiKey,
                          "language": request.language]
        var mutableRequest = request
        let apiRequest = ApiRequest<MovieEndpoint>(httpMethod: .get, path: mutableRequest.combineUrl(), parameters: parameters)
        
        let cancelable = networkManager.loadData(urlRequest: apiRequest, responseModel: MovieDetail.Response.self) { (result) in
            completionHandler(result)
        }
        
        cancelableRequests?.append(cancelable)
    }
    
    deinit {
        cancelableRequests?.forEach{ $0.cancel() }
    }
}
