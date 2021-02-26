//
//  RemoteConfig.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 25.02.2021.
//

import Foundation
import FirebaseRemoteConfig

private struct RemoteConfigConstants {
    static let splashText = "splashText"
}

final class FBRemoteConfig {
    
    static let instance = FBRemoteConfig()
    private var remoteConfig: RemoteConfig?
    
    private init() {
        remoteConfig = RemoteConfig.remoteConfig()
        
        
    }
    
    func prepare(_ completed: @escaping (() -> Void)) {
        guard let remoteConfig = remoteConfig else { return }
        remoteConfig.fetchAndActivate(completionHandler: { (status, error) in
            if status == .successFetchedFromRemote {
                print("Successfully fetched remote config")
            } else {
                print("Error fetched remote config", error.debugDescription)
            }
            completed()
        })
        
    }
}

extension FBRemoteConfig {
    
    var splashText: String {
        remoteConfig?.configValue(forKey: RemoteConfigConstants.splashText).stringValue ?? ""
    }
}
