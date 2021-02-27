//
//  MoviesModal.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let title, year: String
    let genre, director: String
    let actors, language: String
    let poster: String
    let imdbRating, imdbID: String
    let production: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case language = "Language"
        case poster = "Poster"
        case imdbRating, imdbID
        case production = "Production"
    }
}
