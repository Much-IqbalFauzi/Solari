//
//  RunProgress.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct RunProgressScreen: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        VStack(spacing: 10) {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 380, height: 80)
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: 380, height: 370)
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: 380, height: 80)
            
            HStack(spacing: 10) {
                       Rectangle()
                           .fill(Color.red)
                           .frame(width: 185, height: 100)
                       
                       Rectangle()
                           .fill(Color.blue)
                           .frame(width: 185, height: 100)
                   }
            
            HStack(spacing: 10) {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 185, height: 100)
                           }
                }
            }
        }

#Preview {
    RunProgressScreen()
}
