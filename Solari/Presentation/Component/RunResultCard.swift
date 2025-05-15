//
//  RunResultCard.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 29/03/25.
//

import SwiftUI

struct RunResultCard: View {
    let runResultType: String
    @State var runResultValue: String
    var runResultMetric: String = ""
    
    var body: some View {
            ZStack {
                // Running Summary Text
                VStack(alignment: .center) {
                    Text(runResultType)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    
                    Text(runResultValue)
                        .font(Font.custom("LeagueGothic-Regular", size: 75))
                    
                    Text(runResultMetric)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    
                }
            }
    }
}

#Preview {
    RunResultCard(
        runResultType: "Distance", runResultValue: "7.2", runResultMetric: "km"
    )
}
