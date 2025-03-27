//
//  RouteStartPoint.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct RouteStartPointScreen: View {
    var body: some View {
        VStack(spacing: 10) {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 380, height: 80)
            
            HStack(spacing: 10) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 185, height: 480)
                VStack(spacing: 10) {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 185, height: 105)
                    
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 185, height: 250)
                    
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 185, height: 105)
                }
            }
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
    RouteStartPointScreen()
}
