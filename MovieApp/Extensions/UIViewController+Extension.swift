//
//  UIViewController+Extension.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import UIKit

extension UIViewController {
    
    var rootView: UIViewController? {
        get {
            guard let rootVC = UIApplication.shared.windows.first else { return nil }
            return rootVC.rootViewController
        }
        set {
            guard let rootVC = UIApplication.shared.windows.first else { return }
            rootVC.rootViewController = newValue
            rootVC.makeKeyAndVisible()
        }
    }
}
