//
//  Home.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct HomeScreen: View {
    
    
    var body: some View {
        HStack {
            ForEach(CardSummary.summaries, id: \.summaryType) { summary in
                    summary
            }
        }
    }
}

#Preview {
    HomeScreen()
}
