//
//  NetworkError.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import Foundation

enum NetworkError: Error {
    case generic
    case invalidJson
    case invalidUrl
    
    var message: String {
        switch self {
        case .generic:
            return "Generic"
        case .invalidJson:
            return "Invalid Json"
        case .invalidUrl:
            return "Invalid Url"
        }
    }
}
