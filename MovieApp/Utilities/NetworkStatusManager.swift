//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 25.02.2021.
//

import Foundation
import Network

enum NetWorkstatus {
    case isOn
    case isOff
}

final class NetworkStatusManager {
    
    static let manager = NetworkStatusManager()
    private var monitor: NWPathMonitor?
    
    private init() {
        monitor = NWPathMonitor()
        monitor?.start(queue: .main)
    }
    
    func checkNetwork(_ status: @escaping ((NetWorkstatus) -> Void)) {
        guard let monitor = self.monitor else { return }
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                status(.isOn)
            } else {
                status(.isOff)
            }
        }
    }
    
}
