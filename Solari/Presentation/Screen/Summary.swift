//
//  Summary.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import MapKit
import SwiftData
import SwiftUI

struct SummaryScreen: View {
    var routeId: UUID
    @EnvironmentObject var navigationManager: NavigationManager
    var runDataManager: RunDataManager
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @Query(sort: \RunSession.date, order: .forward) var runSessions:
    [RunSession]
    @StateObject private var viewModel: SummaryViewModel
    var isDummy: Bool = false
    @State private var showCamera = false
    @State private var takenImage: UIImage?
    @State private var navigateToCamera = false
    
    
    init(routeId: UUID, runDataManager: RunDataManager) {
        self.routeId = routeId
        self.runDataManager = runDataManager
        _viewModel = StateObject(
            wrappedValue: SummaryViewModel(
                routeId: routeId
            ))
    }
    
    var body: some View {
        VStack {
            ZStack{
                Map {
                    MapPolyline(
                        coordinates: viewModel.route.markers.compactMap {
                            $0.coordinate
                        }
                    )
                    .stroke(.blue .opacity(0.3), lineWidth: 8.0)
                    
                    MapPolyline(
                        coordinates: runDataManager.locationHistory.map {
                            $0.coordinate
                        }
                    )
                    .stroke(Color.greenYellow, lineWidth: 5.0)
                    
                    UserAnnotation()
                        .stroke(Color.red, lineWidth: 8.0)
                        .mapOverlayLevel(level: MKOverlayLevel.aboveRoads)
                        .tint(.red)
                    
                    ForEach(viewModel.route.markers.indices, id: \.self) {
                        idx in
                        let marker = viewModel.route.markers[idx]
                        if marker.showMarker {
                            Marker(
                                marker.name,
                                systemImage: "figure.run.circle.fill",
                                coordinate: marker.coordinate
                            )
                            .tint(.blue)
                        }
                    }
                }
                .mapStyle(.standard)
                .shadow(radius: 4)
                
                VStack {
                    FinishTitle()
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 0) {
                        RunResultCard(
                            runResultType: "Time",
                            runResultValue: runDataManager.formatDuration(
                                runSessions.last?.distance ?? 0)
                            
                        )
                        
                        Rectangle().fill(Color.gray.opacity(0.3)).frame(width: 300, height: 1)
                            .padding(.top, -15)
                        
                        HStack {
                            RunResultCard(
                                runResultType: "Distance",
                                runResultValue: runDataManager.formatDistanceInKM(
                                    runSessions.last?.duration ?? 0),
                                runResultMetric: "km"
                            )
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 1, height: 130)
                                .padding(.horizontal, 15)
                            
                            RunResultCard(
                                runResultType: "Pace",
                                runResultValue: runDataManager.formatPaceString(
                                    distance: runSessions.last?.distance ?? 0,
                                    time: runSessions.last?.duration ?? 0
                                ),
                                runResultMetric: "min/km"
                            )
                        }
                    }
                    
                    HStack {
                        // Home
                        Button(action: {
                            // Reset run data and navigate to home screen
                            navigationManager.reset()
                            runDataManager.resetLocationHistory()
                        }) {
                            Label("", systemImage: "arrow.turn.down.left")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(minWidth: 60, minHeight: 60)
                                .foregroundColor(.primary)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(.black, lineWidth: 2)
                                )
                        }
                        
                        // Navigate to CameraCaptureView
                        RunButton(buttonText: "Share Your Run", trailingIcon: "", action: {
                            navigationManager.navigate(to: .camera(routeId: routeId))
                        })
                        
                    }
                    .padding(.horizontal)
                }
            }
            //end Zstack
        }
    }
}

#Preview {
    SummaryScreen(
        routeId: UUID(),
        runDataManager: RunDataManager(locationManager: MyLocationManager()))
}
