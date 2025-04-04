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
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var runDataManager: RunDataManager? = nil
    
    @StateObject var selectRouteViewModel = SelectRouteViewModel(locationManager: MyLocationManager())
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                if showModalAlert {
                    Alert()
                        .transition(.scale)
                }
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
                    
                    RunButton(buttonText: "Run Now", action: {
                        if (!locationManager.isNearLocation) {
                            withAnimation {
                                showModalAlert.toggle()
                            } completion: {
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
                                    showModalAlert.toggle()
                                }
                            }
                        } else {
                            selectRouteViewModel.navigateRunProgressHandler()
                        }
                    })
                }
            }
        }
    }
}
#Preview {
    RouteStartPointScreen()
}
