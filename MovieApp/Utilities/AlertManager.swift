//
//  AlertManager.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 25.02.2021.
//

import UIKit

enum AlertType {
    
    case alert(title: String, message: String)
}

final class AlertManager {
    
    static let manager = AlertManager()
    private var alert: UIAlertController
    
    private init() {
        alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    }
    
    func showPopupAlert(_ type: AlertType, _ presentViewController: UIViewController) {
        switch type {
        case .alert(let title, let message):
            alert.title = title
            alert.message = message
            if !alert.isBeingPresented {
                presentViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
