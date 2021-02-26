//
//  ServiceDefinable.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation
import Moya

protocol ServiceDefinable: Moya.TargetType { }

typealias Method = Moya.Method
typealias Task = Moya.Task
typealias URLEncoding = Moya.URLEncoding

extension ServiceDefinable {
    
    var baseURL: URL {
        // Base url as defined movie, If you want to change you can override it
        URL(string: ConfigManager.MovieService.baseUrl.value)!
    }
        
    var sampleData: Data {
        Data()
    }
    
    var method: Method {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        ["Content-type": "application/json"]
    }
}
