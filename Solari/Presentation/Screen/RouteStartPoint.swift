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
                    Spacer(minLength: 10)
                    if showModalAlert {
                        Alert()
                            .transition(.scale)
                    }
                    VStack(spacing:0) {
                        
                        VStack(spacing: 10) {
                            ChooseMap()
                        }
                        
                        VStack(spacing: 10) {
                            ChoosePoint()
                            //choosepoint ini tinggal di adjust pas long dan short berapa point dan di connect ke annotations yg muncul huruf itu. jadi pas a di click nanti lgsg ke bagian point a trus pas run now ke setnya dari situ dan seterusnya. trus pas di short run cuman 2 titik inti dan di long rung ada 3 titik inti
                            
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
            .padding(.bottom, 48)
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
