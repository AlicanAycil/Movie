//
//  MovieDetailModels.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.

import UIKit

enum MovieDetail {
    
    struct Request {
        var movieDetailUrl: String = "/3/movie/"
        let apiKey: String = StorageManager.apiKey.rawValue
        let language: String = StorageManager.language.rawValue
        let movieId: Int
        
        mutating func combineUrl() -> String {
            movieDetailUrl += String(movieId)
            return movieDetailUrl
        }
    }
    
    struct Response:  Decodable {
        let title: String
        let overview: String
        let posterPath: String
        let voteCount: Int
        
        enum CodingKeys: String, CodingKey {
            case title
            case overview
            case posterPath = "poster_path"
            case voteCount = "vote_count"
        }
    }
    
    struct ViewModel {
        let movieDetailItem: MovieDetailItem
    }
    
}

struct MovieDetailItem {
    let title: String
    let overview: String
    let posterPath: URL?
    let voteCount: String
}
