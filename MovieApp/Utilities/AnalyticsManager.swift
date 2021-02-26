//
//  Analytics.swift
//  MovieApp
//
//  Created by Erdem ILDIZ on 26.02.2021.
//

import Foundation
import FirebaseAnalytics

enum AnalyticsEvents {
    case page(_ screen: Screens)
}

final class AnalyticsManager {
    
    static let manager = AnalyticsManager()
    
    private init() {}
    
    func trach(_ event: AnalyticsEvents) {
        switch event {
        case .page(let screen):
            Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: screen.value])
        }
    }
}
