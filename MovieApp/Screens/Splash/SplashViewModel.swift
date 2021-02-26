//
//  SplashViewModel.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

final class SplashViewModel {
    
    private weak var view: SplashViewControllerProtocol?
    
    init(view: SplashViewControllerProtocol) {
        self.view = view
    }
        
    private func checkInternetConneciton() {
        NetworkStatusManager.manager.checkNetwork { [weak self] (status) in
            self?.view?.handleOutput(.interntConnectionStatus(isHaveConnection: status == .isOn))
            // Set timer If connection is on
            if status == .isOn {
                self?.startTimer()
            }
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.view?.handleOutput(.redirectHomePage)
        }
    }
    
}


extension SplashViewModel: SplashViewModelProtocol {
    func checkInterntConnection() {
        checkInternetConneciton()
    }
}
