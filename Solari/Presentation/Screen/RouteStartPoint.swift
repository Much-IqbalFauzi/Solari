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
                if showModalAlert {
                    Alert()
                        .transition(.scale)
                }
                VStack(spacing: 10) {

                    TabView(selection: $viewModel.selectedIndex) {
                        ForEach(
                            Array(viewModel.listRoute.enumerated()),
                            id: \.offset
                        ) { index, route in
                            VStack {
                                Text(route.name)
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .frame(width: 380, height: 50)
                                Map(
//                                    initialPosition: mapCameraPosition,
                                    interactionModes: [.zoom],
                                    selection: $viewModel.selectedRouteId
                                ) {
                                    ForEach(
                                        Array(
                                            route.markers.enumerated()),
                                        id: \.offset
                                    ) { idx, marker in
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

                    VStack(spacing: 10) {
                        //                        ChoosePoint()
                        Text("Select Start Point:")
                        Spacer()
                        HStack {
                            ForEach(
                                Array(
                                    viewModel.listRoute[viewModel.selectedIndex]
                                        .startPoints.enumerated()), id: \.offset
                            ) { idx, marker in
                                ChoosePoint(
                                    buttonText: "\(idx + 1)",
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
                                        showModalAlert.toggle()
                                    } completion: {
                                        DispatchQueue.main.asyncAfter(
                                            deadline: DispatchTime.now()
                                                + .seconds(2)
                                        ) {
                                            showModalAlert.toggle()
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
