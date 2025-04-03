//
//  RouteStartPoint.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI
import MapKit

struct RouteStartPointScreen: View {
    @State private var showModalAlert = false
    @StateObject private var locationManager = MyLocationManager()
    
    var body: some View {
        VStack(spacing: 10) {
            
            VStack(spacing: 10) {
                ChooseMap()
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.black]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 360, height: 80)
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
