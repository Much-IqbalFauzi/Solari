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
    @ObservedObject private var locationManager: MyLocationManager
    @StateObject var selectRouteViewModel: SelectRouteViewModel
    
    
    init(locationManager: MyLocationManager, navigationManager: NavigationManager) {
        self.locationManager = locationManager
        _selectRouteViewModel = StateObject(wrappedValue: SelectRouteViewModel(
            locationManager: locationManager,
            navigationManager: navigationManager
        ))
    }
    
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
    let mockLocationManager = MyLocationManager()
    let mockNavigationManager = NavigationManager()
    
    return RouteStartPointScreen(
        locationManager: mockLocationManager,
        navigationManager: mockNavigationManager
    )
}
