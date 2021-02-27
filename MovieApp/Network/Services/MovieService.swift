//
//  MovieProvider.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

enum MovieService {
    case getRandom(movie: String)
}

extension MovieService: ServiceDefinable {
    
    var path: String {
        switch self {
        case .getRandom:
            return ""
        }
    }
    
    var task: Task {
        switch self {
        case .getRandom(let movie):
            return .requestParameters(parameters: [
                "t": movie,
                "plot": "full",
                "apikey": ConfigManager.MovieService.apiKey.value
            ], encoding: URLEncoding.default)
        }
    }
    
}
