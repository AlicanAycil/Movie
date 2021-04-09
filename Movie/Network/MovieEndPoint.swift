//
//  MovieEndPoint.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import Foundation

final class MovieEndpoint: NetworkConfiguration {
    
    static var shared: NetworkConfiguration = MovieEndpoint()
    var headers: HTTPHeaders?
    var host: String {
        return "api.themoviedb.org"
    }
    
    required init() {}
}
