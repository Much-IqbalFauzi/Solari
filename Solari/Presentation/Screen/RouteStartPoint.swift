//
//  RouteStartPoint.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct RouteStartPointScreen: View {
    @State private var showModalAlert = false
    @StateObject private var locationManager = MyLocationManager()
    var body: some View {
        VStack(spacing: 10) {
            Text("Short Run")
                .font(.system(size: 24, weight: .bold, design: .default))
                .frame(width: 380, height: 80)
            
            HStack(spacing: 10) {
                Image("runMap1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 185, height: 480)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
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
                ChoosePoint()
                NavigationLink(destination: RunProgressScreen()) {
                    RunButton(buttonText: "Run Now")
                }
           }
        }
    }
}
#Preview {
    RouteStartPointScreen()
}
