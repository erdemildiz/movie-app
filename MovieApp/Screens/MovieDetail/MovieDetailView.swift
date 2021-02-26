//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import UIKit
import Kingfisher

class MovieDetailView: UIViewController {
    
    // Elements
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var imdbRatingLabel: UILabel!
    @IBOutlet weak var productionLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set elements values
        setElementsValue()
        // Set Analytics
        sendAnalticsData()
    }
    
    private func setElementsValue() {
        guard
            let movie = movie,
            let movieImageUrl = URL(string: movie.poster)
            else { return }
        title = movie.title
        movieImageView.kf.setImage(with: movieImageUrl)
        genreLabel.text      = "\(Constants.genre): \(movie.genre)"
        directorLabel.text   = "\(Constants.direction): \(movie.director)"
        actorLabel.text      = "\(Constants.actor): \(movie.actors)"
        languageLabel.text   = "\(Constants.language): \(movie.language)"
        imdbRatingLabel.text = "\(Constants.imdbrating): \(movie.imdbRating)"
        productionLabel.text = "\(Constants.production): \(movie.production)"
    }
    
    
    private func sendAnalticsData() {
        AnalyticsManager.manager.trach(.page(.moviedetail))
    }

}
