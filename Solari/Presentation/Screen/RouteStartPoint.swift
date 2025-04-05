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
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var runDataManager: RunDataManager? = nil
    
    @StateObject var selectRouteViewModel = SelectRouteViewModel(locationManager: MyLocationManager())
    
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    Spacer(minLength: 45)
                    if showModalAlert {
                        Alert()
                            .transition(.scale)
                    }
                    VStack(spacing: 10) {
                        
                        VStack(spacing: 10) {
                            ChooseMap()
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
    }

#Preview {
    RouteStartPointScreen()
}
