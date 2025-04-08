//
//  RouteStartPoint.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import MapKit
import SwiftUI

struct RouteStartPointScreen: View {
    @State private var showModalAlert = false
    @ObservedObject private var locationManager: MyLocationManager
    @StateObject var viewModel: SelectRouteViewModel

    let mapCameraPosition: MapCameraPosition = .region(
        .init(
            center: .init(latitude: -6.30137, longitude: 106.65303),
            latitudinalMeters: 340, longitudinalMeters: 340))

    init(
        locationManager: MyLocationManager, navigationManager: NavigationManager
    ) {
        self.locationManager = locationManager
        _viewModel = StateObject(
            wrappedValue: SelectRouteViewModel(
                locationManager: locationManager,
                navigationManager: navigationManager
            ))

    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                if viewModel.isNearAlertShown {
                    Alert(title: "You're too far from Green Office Park.")
                        .transition(.scale)
                }
                if viewModel.isStartPointSelected {
                    Alert(title: "Please select start point", type: .yellow)
                        .transition(.scale)
                }
                VStack(spacing: 10) {

                    TabView(selection: $viewModel.selectedIndex) {
                        ForEach(
                            Array(viewModel.listRoute.enumerated()),
                            id: \.offset
                        ) { index, route in
                            VStack {
                                Spacer()
                                Text(route.name)
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .frame(width: 380, height: 50)
                                Map(
                                    //                                    initialPosition: mapCameraPosition,
                                    interactionModes: [.zoom],
                                    selection: $viewModel.selectedRouteId
                                ) {
                                    MapPolyline(
                                        coordinates: route.markers.compactMap {
                                            $0.coordinate
                                        }
                                    )
                                    .stroke(.blue, lineWidth: 8.0)
                                    ForEach(
                                        Array(
                                            route.markers.enumerated()),
                                        id: \.offset
                                    ) { idx, marker in

                                        if marker.showMarker {
                                            Marker(
                                                marker.name,
                                                systemImage:
                                                    "figure.run.circle.fill",
                                                coordinate: marker
                                                    .coordinate
                                            ).tint(
                                                viewModel
                                                    .selectedRouteId
                                                    == marker.id
                                                    ? .orange : .blue)
                                        }
                                    }
                                }.cornerRadius(15)
                                    .shadow(radius: 4)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 6)
                            }

                        }
                    }
                    .tabViewStyle(
                        .page(indexDisplayMode: .automatic)
                    )
                    .frame(width: 380, height: 480)
                    .onAppear {
                        UIPageControl.appearance()
                            .currentPageIndicatorTintColor =
                            UIColor.action
                        UIPageControl.appearance()
                            .pageIndicatorTintColor =
                            UIColor.lightGray
                    }
                    .onChange(of: viewModel.selectedIndex) {
                        superOldValue, newValue in
                        viewModel.resetRouteStartPoint()
                    }

                    VStack(spacing: 10) {
                        //                        ChoosePoint()
                        Text("Select Start Point:")
                       
                        HStack {
                            ForEach(
                                Array(
                                    viewModel.listRoute[viewModel.selectedIndex]
                                        .startPoints.enumerated()), id: \.offset
                            ) { idx, marker in
                                ChoosePoint(
                                    buttonText: marker.name,
                                    isActive: viewModel.selectedRouteId
                                        == marker.id,
                                    action: {
                                        viewModel.selectedRouteId = marker.id
                                    })
                            }
                        }
                        Spacer()
                        RunButton(
                            buttonText: "Run Now",
                            action: {
                                if !locationManager.isNearLocation {
                                    withAnimation {
                                        viewModel.isNearAlertShown.toggle()
                                    } completion: {
                                        DispatchQueue.main.asyncAfter(
                                            deadline: DispatchTime.now()
                                                + .seconds(2)
                                        ) {
                                            viewModel.isNearAlertShown.toggle()
                                        }
                                    }
                                    return
                                }
                                if viewModel.selectedRouteId == nil {
                                    withAnimation {
                                        viewModel.isStartPointSelected.toggle()
                                    } completion: {
                                        DispatchQueue.main.asyncAfter(
                                            deadline: DispatchTime.now()
                                                + .seconds(2)
                                        ) {
                                            viewModel.isStartPointSelected
                                                .toggle()
                                        }
                                    }
                                } else {
                                    viewModel
                                        .navigateRunProgressHandler()
                                }
                            })
                    }
                }
            }

            .padding(.bottom, 48)
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
