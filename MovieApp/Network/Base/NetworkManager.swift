//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation
import Moya

/// Network managment
struct NetworkManager<Target> where Target: Moya.TargetType  {
    
    internal let provider = MoyaProvider<Target>(plugins: [NetworkLoggerPlugin()])
    
    /// Network request
    /// - Parameters:
    ///   - target: TargetType
    ///   - model: Codable
    ///   - completion: Result<MoyaResponse, MoyaError>
    /// - Returns: callback Result<MoyaResponse, MoyaError>
    @discardableResult
    func request<T: Decodable>(
        target: Target,
        _ model: T.Type,
        _ completion: @escaping (Result<T, MoyaError>) -> Void
    ) -> Cancellable? {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let mapResponse = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(mapResponse))
                } catch let error {
                    completion(.failure(.encodableMapping(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
