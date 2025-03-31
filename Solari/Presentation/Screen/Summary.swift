//
//  Summary.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct SummaryScreen: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Congratulations!")
                .font(.largeTitle)
                .bold()
            
            HStack(alignment: .top) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 185, height: 410)
                
                Spacer()

                
                VStack() {
                    RunResultCard(runResultType: "KM", runResultValue: "2.2")
                    
                    RunResultCard(runResultType: "Minutes", runResultValue: "30")
                }
            }
            VStack(spacing: 10) {
                           Rectangle()
                               .fill(Color.orange)
                               .frame(width: 380, height: 80)
                           
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 115, height: 170)
                    
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 115, height: 170)
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 115, height: 170)
                }
                }
        }
        .padding()
    }
}
#Preview {
    SummaryScreen()
}
