//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

final class MoviesViewModel {
    
    weak var view: MoviesViewControllerProtocol?
    private let randomMovies = ["Home", "City", "World", "People"]
    var movies = [Movie]()
    
    init(view: MoviesViewControllerProtocol) {
        self.view = view
        fetchRandomOne()
    }
    
    private func fetchRandomOne() {
        let movieName = randomMovies[Int.random(in: 0..<randomMovies.count)]
        getMovie(movieName)
    }
    
    func fetchMoviewBy(using movieName: String) {
        getMovie(movieName)
    }
    
    /// Fetch movies
    /// - Parameter movieName: String
    private func getMovie(_ movieName: String){
        NetworkManager<MovieService>().request(target: .getRandom(movie: movieName), Movie.self) { [weak self] (result) in
            switch result {
            case .success(let movie):
                self?.movies.append(movie)
                self?.view?.handleOutput(.fetchedMovies)
            case .failure(let error):
                self?.view?.handleOutput(.showAlert(title: Constants.notfound, message: error.localizedDescription))
            }
        }
    }
}
