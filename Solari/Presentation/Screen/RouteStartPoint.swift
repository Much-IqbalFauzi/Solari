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
    @State private var showInfoSheet = false
    @State private var scale: Double
    @State private var region: MKCoordinateRegion
    @State private var cameraPosition: MapCameraPosition
    
    init(
        locationManager: MyLocationManager, navigationManager: NavigationManager
    ) {
        self.locationManager = locationManager
        _viewModel = StateObject(
            wrappedValue: SelectRouteViewModel(
                locationManager: locationManager,
                navigationManager: navigationManager
            ))
        
        let initialScale: Double = 340
        let initialRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: -6.30147, longitude: 106.65196),
                latitudinalMeters: initialScale,
                longitudinalMeters: initialScale
            )
            _scale = State(initialValue: initialScale)
            _region = State(initialValue: initialRegion)
            _cameraPosition = State(initialValue: .region(initialRegion))

    }
    
    func zoom(factor: Double) {
        scale *= factor
        cameraPosition = .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: -6.30147, longitude: 106.65196),
                latitudinalMeters: scale,
                longitudinalMeters: scale
            )
        )
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
                                HStack (
                      
                                    
                                    
                                    spacing: -80
                                ){
                                    Text(route.name)
                                        .font(.system(size: 30))
                                        .fontWeight(.semibold)
                                        .frame(width: 380, height: 50)
                                    Button(action: {
                                        showInfoSheet = true
                                    }) {
                                        Image(systemName: "info.circle")
                                            .padding()
                                            .font(.system(size: 25))
                                            .clipShape(Circle())
                                    }
                                    Spacer()
                                        .sheet(isPresented: $showInfoSheet) {
                                            InfoModalView(titleText: route.name, infoText: route.description,images:route.imageNames)
                                                .presentationDetents([.medium])
                                                .presentationDragIndicator(.visible)
                                        }
                                }
                                ZStack(alignment: .bottomTrailing) {
                                    Map(
                                        //position: $cameraPosition,
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
                                                        .selectedStartPoint
                                                    == marker.id
                                                    ? .orange : .blue)
                                            }
                                        }
                                    }.cornerRadius(15)
                                        .shadow(radius: 4)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 6)
                                    
                                    VStack(spacing: 13) {
                                        Button {
                                            zoom(factor: 0.8)
                                        } label: {
                                            Image(systemName: "plus.magnifyingglass")
                                                .frame(width: 10, height: 10)
                                                .padding()
                                                .background(Color.white.opacity(0.8))
                                                .clipShape(Circle())
                                        }
                                        
                                        Button {
                                            zoom(factor: 1.25)
                                        } label: {
                                            Image(systemName: "minus.magnifyingglass")
                                                .frame(width: 10, height: 10)
                                                .padding()
                                                .background(Color.white.opacity(0.8))
                                                .clipShape(Circle())
                                        }
                                    }
                                    .padding([.bottom, .trailing], 18)
                                }
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
                        Text("Select Start Point:")
                        HStack {
                            ForEach(
                                Array(
                                    viewModel.listRoute[viewModel.selectedIndex]
                                        .startPoints.enumerated()), id: \.offset
                            ) { idx, marker in
                                ChoosePoint(
                                    buttonText: marker.name,
                                    isActive: viewModel.selectedStartPoint
                                        == marker.id,
                                    action: {
                                        viewModel.selectedStartPoint = marker.id
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
                                if viewModel.selectedStartPoint == nil {
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
