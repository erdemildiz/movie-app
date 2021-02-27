//
//  SplashView.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 25.02.2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    var viewModel: SplashViewModel?
    
    lazy var splashLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI
        setupUI()
        
        // Chekck internet connection
        viewModel?.checkInterntConnection()
    }
    
    fileprivate func setupUI(){
        viewModel = SplashViewModel(view: self)
        // Setup View
        setupView()
        // Setup splash text constraints
        setupSplashText()
        // Set Analytics
        AnalyticsManager.manager.trach(.page(.splash))
    }
    
    // MARK:- Setup View
    fileprivate func setupView() {
        view.backgroundColor = .white
    }
    
    // MARK:- Splash Text
    fileprivate func setupSplashText() {
        view.addSubview(splashLabel)
        splashLabel.text = FBRemoteConfig.instance.splashText
        NSLayoutConstraint.activate([
            splashLabel.widthAnchor.constraint(equalToConstant: 100),
            splashLabel.heightAnchor.constraint(equalToConstant: 20),
            splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
   
}

// MARK:- SplashSplashViewModelProtocol
extension SplashViewController: SplashViewControllerProtocol {
    func handleOutput(_ output: SplashViewModelOutput) {
        switch output {
        case .interntConnectionStatus(let isHaveConnection):
            if !isHaveConnection {
                AlertManager.manager.showPopupAlert(.alert(title: Constants.connectionStatus, message: Constants.notconnection), self)
            }
        case .redirectHomePage:
            let moviesView = MoviesView()
            rootView = UINavigationController(rootViewController: moviesView)
        }
    }
}
