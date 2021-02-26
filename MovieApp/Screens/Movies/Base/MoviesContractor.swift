//
//  MoviesContractor.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

// View
protocol MoviesViewControllerProtocol: AnyObject {
    
    func handleOutput(_ output: MoviesViewModelOutput)
}

// View Model
enum MoviesViewModelOutput {
    
    case fetchedMovies
    case showAlert(title: String, message: String)
}
