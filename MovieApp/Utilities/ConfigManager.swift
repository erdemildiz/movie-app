//
//  ConfigManager.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

struct ConfigManager {
    
    // Service url
    enum MovieService {
        case baseUrl
        case apiKey
        
        var value: String {
            switch self {
            case .baseUrl:
                return "http://www.omdbapi.com/"
            case .apiKey:
                return "fa86c8e3"
            }
        }
    }
    
}
