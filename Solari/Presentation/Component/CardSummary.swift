//
//  SwiftUIView.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 26/03/25.
//

import SwiftUI

struct CardSummary: View {
    let summaryType: String
    @State var summaryValue: String
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .frame(width: 100, height: 140)
                    .shadow(radius: 2, x: 0, y: 2)
                
                // Running Summary Text
                VStack(alignment: .leading, spacing: 2) {
                    Text(summaryType)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(summaryValue)
                        .font(.system(size: 50, weight: .bold))
                        .minimumScaleFactor(0.5)
                }
                .padding(10)
                .frame(width: 100, height: 140, alignment: .leading)
            }
            .frame(width: 100, height: 140)
    }
}

#Preview {
    CardSummary(summaryType: "KM", summaryValue: "200")
}
