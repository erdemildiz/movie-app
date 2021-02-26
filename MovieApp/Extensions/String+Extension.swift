//
//  String+Extension.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 25.02.2021.
//

import Foundation

extension String {
    
    static func localize(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
