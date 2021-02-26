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

