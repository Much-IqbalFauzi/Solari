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
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("summaryColor"))
                    .frame(width: 140, height: 140)
                    .shadow(radius: 2, x: 0, y: 2)
                
                // Running Summary Text
                VStack(alignment: .leading) {
                    Text(runResultType)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(runResultValue)
                        .font(.system(size: 50, weight: .bold))
                        .minimumScaleFactor(0.5)
                }
                .padding(10)
                .frame(width: 140, height: 140, alignment: .leading)
            }
    }
}

#Preview {
    RunResultCard(runResultType: "Minutes", runResultValue: "30")
}
