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

/// Analtick managment
final class AnalyticsManager {
    
    static let manager = AnalyticsManager()
    
    private init() {}
    
    /// Log events
    /// - Parameter event: AnalyticsEvents
    func trach(_ event: AnalyticsEvents) {
        switch event {
        case .page(let screen):
            Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: screen.value])
        }
    }
}
