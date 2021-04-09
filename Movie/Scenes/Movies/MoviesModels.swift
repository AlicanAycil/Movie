//
//  MoviesModels.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.


import UIKit

enum Movies {
    
    struct Request {
        let popularMoviesUrl: String = "/3/movie/popular"
        let apiKey: String = StorageManager.apiKey.rawValue
        let language: String = StorageManager.language.rawValue
        let page: Int
    }
    
    struct Response:  Decodable {
        let page: Int
        var results: [MovieItem] = []
        
        struct MovieItem:  Decodable {
            let id: Int
            let title: String
            let posterPath: String
            
            enum CodingKeys: String, CodingKey {
                    case id
                    case title
                    case posterPath = "poster_path"
            }
        }
    }
    
    struct ViewModel {
        var movies: [MovieItemCellModel] = []
    }
}

struct MovieItemCellModel {
    let id: Int
    let title: String
    let posterFullPath: URL?
}

enum ListType {
    case list
    case grid
}

enum MoviesImage: String {
    
    static let baseURl = "https://image.tmdb.org/t/p"

    case orijinal = "/original"
    case w500 = "/w500"
    
    var path: String {
        return MoviesImage.baseURl + rawValue
    }
}
