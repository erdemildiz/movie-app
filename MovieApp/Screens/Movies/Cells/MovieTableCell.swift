//
//  MovieTableCell.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import UIKit
import Kingfisher

class MovieTableCell: UITableViewCell {
    
    static let cellIdentifier = "MovieTableCellIdentifier"
    static let nibName = "MovieTableCell"
    
    // Elements
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            setElementsValue()
        }
    }
    
    private func setElementsValue(){
        guard
            let movie = movie,
            let movieImageUrl = URL(string: movie.poster)
            else { return }
        movieImageView.kf.setImage(with: movieImageUrl)
        movieTitleLabel.text = movie.title
        movieGenreLabel.text = movie.genre
        movieYearLabel.text  = movie.year
    }
    
}
