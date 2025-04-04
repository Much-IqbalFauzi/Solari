//
//  RunMetricCard.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 04/04/25.
//

import SwiftUI

struct RunMetricCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.title2)
                .bold()
        }
        .frame(width: 115, height: 80)
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    RunMetricCard(title: "Test", value: "10")
}
