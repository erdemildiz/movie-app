//
//  AppConstants.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

enum Screens: String {
    
    case splash      = "Splash"
    case movie       = "Movie"
    case moviedetail = "Movie Detail"
    
    var value: String {
        "\(self)"
    }
}

struct AppUrls {
    
    enum MovieService: String {
        case baseUrl = "http://www.omdbapi.com/"
        case apiKey  = "fa86c8e3"
        
        var value: String {
            return "\(self.rawValue)"
        }
    }
}
