//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import UIKit

class MoviesView: UITableViewController {
    
    var viewModel:  MoviesViewModel?
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.automaticallyShowsCancelButton = false
        searchController.searchBar.placeholder = Constants.searchMovie
        return searchController
    }()
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.startAnimating()
        return loadingIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI
        setupUI()
        // Register Cell
        registerCell()
    }
    
    private func setupUI() {
        // Set loading
        tableView.backgroundView = loadingIndicator
        // Set view modal
        viewModel = MoviesViewModel(view: self)
        // Set background color
        view.backgroundColor = .white
        // Nav title
        title = Screens.movie.value
        // Set Search bar
        navigationItem.searchController = searchController
        // Set table style
        tableView.separatorStyle = .none
        // Set Analytics
        AnalyticsManager.manager.trach(.page(.movie))
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: MovieTableCell.nibName, bundle: nil), forCellReuseIdentifier: MovieTableCell.cellIdentifier)
    }
}


// MARK:- UISearchBarDelegate
extension MoviesView: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let movieName = searchBar.text else { return }
        viewModel?.fetchMoviewBy(using: movieName)
    }    
    
}

// MARK:- TableView Delegate
extension MoviesView {
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableCell.cellIdentifier) as? MovieTableCell,
            let movies = viewModel?.movies, movies.count > 0 else { return UITableViewCell() }
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movies = viewModel?.movies, movies.count > 0 else { return }
        let movieDetail = MovieDetailView()
        movieDetail.movie = movies[indexPath.row]
        navigationController?.pushViewController(movieDetail, animated: true)
    }
}


// MARK: View Output
extension MoviesView: MoviesViewControllerProtocol {
    func handleOutput(_ output: MoviesViewModelOutput) {
        switch output {
        case .fetchedMovies:
            loadingIndicator.stopAnimating()
            self.tableView.reloadData()
        case .showAlert(let title, let message):
            AlertManager.manager.showPopupAlert(.alert(title: title, message: message), self)
        }
    }
}
