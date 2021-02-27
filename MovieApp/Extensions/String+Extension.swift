//
//  String+Extension.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 25.02.2021.
//

import Foundation

extension String {
    
    /// Localization
    /// - Parameter key: String
    /// - Returns: String
    static func localize(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
