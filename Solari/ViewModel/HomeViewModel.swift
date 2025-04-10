//
//  HomeCLLocationViewModel.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 29/03/25.
//

import CoreLocation
import SwiftData


class HomeViewModel: ObservableObject {
    let sessions: [RunSession]
    
    init(sessions: [RunSession]) {
        self.sessions = sessions
    }
    
    var totalDistanceInKm: Double {
        sessions.reduce(0) { $0 + $1.distance } / 1000
    }
    
    var totalDurationInMinutes: Int {
        Int(sessions.reduce(0) { $0 + $1.duration } / 60)
    }
    
    var totalSessions: Int {
        sessions.count
    }
    
    func formatValue(_ value: Double) -> String {
        if value == 0 {
            return "0"
        } else {
            return String(format: "%.2f", value)
        }
    }
    
    var summaries: [CardSummary] {
        [
            CardSummary(summaryType: "KM", summaryValue: formatValue(totalDistanceInKm)),
            CardSummary(summaryType: "Minutes", summaryValue: String(totalDurationInMinutes)),
            CardSummary(summaryType: "Sessions", summaryValue: String(totalSessions))
        ]
    }
}
