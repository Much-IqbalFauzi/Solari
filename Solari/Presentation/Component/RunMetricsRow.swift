//
//  RunMetricsRow.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 04/04/25.
//

import SwiftUI

struct RunMetricsRow: View {
    let duration: String
    let distance: String
    let pace: String

    var body: some View {
        HStack(spacing: 10) {
            RunMetricCard(title: "Duration", value: duration)
            RunMetricCard(title: "Distance", value: distance)
            RunMetricCard(title: "Pace", value: pace)
        }
    }
}
