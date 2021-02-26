//
//  SplashContractor.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation

// View
protocol SplashViewControllerProtocol: AnyObject {
    
    func handleOutput(_ output: SplashViewModelOutput)
}

// View Model
enum SplashViewModelOutput {
    
    case interntConnectionStatus(isHaveConnection: Bool)
    case redirectHomePage
}

protocol SplashViewModelProtocol {
    func checkInterntConnection()
}
