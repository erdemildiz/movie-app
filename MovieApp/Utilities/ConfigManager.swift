//
//  ConfigManager.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

/// Manage all service 
struct ConfigManager {
    
    // Service url
    enum MovieService {
        case baseUrl
        case apiKey
        
        var value: String {
            switch self {
            case .baseUrl:
                return AppUrls.MovieService.baseUrl.value
            case .apiKey:
                return AppUrls.MovieService.apiKey.value
            }
        }
    }
    
}
