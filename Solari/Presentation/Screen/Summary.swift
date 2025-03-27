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
            Rectangle()
                .fill(Color.gray)
                .frame(width: 380, height: 80)
            
            HStack(spacing: 10) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 185, height: 410)
                VStack(spacing: 10) {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 185, height: 200)
                    
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 185, height: 200)
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
    }
}
#Preview {
    SummaryScreen()
}
