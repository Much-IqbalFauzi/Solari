//
//  RunProgress.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct RunProgressScreen: View {
    var body: some View {
        VStack(spacing: 10) {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 380, height: 80)
            
            HStack(spacing: 10) {
                       Rectangle()
                           .fill(Color.red)
                           .frame(width: 100, height: 100)
                       
                       Rectangle()
                           .fill(Color.blue)
                           .frame(width: 100, height: 100)
                   }
                   .padding()
                
                
                VStack(spacing: 10) {
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 380, height: 80)
                    
                    Rectangle()
                        .fill(Color.cyan)
                        .frame(width: 380, height: 80)
                }
            }
        }
    }

#Preview {
    RunProgressScreen()
}
