//
//  HomeSummary.swift
//  Solari
//
//  Created by Ailsa Anarghia on 27/03/25.
//

import SwiftUI

struct HomeSummaryText: View {
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: Date())
    }

    var body: some View {
        Text("Solari journey based on \(getCurrentDate())")
            .font(.system(size: 16))
            .foregroundColor(.secondary)
            .padding(3)
    }
}

#Preview {
    HomeSummaryText()
}
