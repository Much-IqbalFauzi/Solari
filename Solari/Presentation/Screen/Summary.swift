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

    init(routeId: UUID, runDataManager: RunDataManager) {
        self.routeId = routeId
        self.runDataManager = runDataManager
        _viewModel = StateObject(
            wrappedValue: SummaryViewModel(
                routeId: routeId
            ))
    }

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            FinishTitle()

            VStack {
                Map(
                    interactionModes: [.zoom]
                ) {
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
                .cornerRadius(15)
                .shadow(radius: 4)
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .frame(width: 380, height: 360)

                LazyVGrid(columns: columns) {
                    RunResultCard(
                        runResultType: "Distance",
                        runResultValue: runDataManager.formatDistanceInKM(
                            runSessions.last?.distance ?? 0)
                    )

                    RunResultCard(
                        runResultType: "Duration",
                        runResultValue: runDataManager.formatDuration(
                            runSessions.last?.duration ?? 0)
                    )

                    RunResultCard(
                        runResultType: "Pace",
                        runResultValue: runDataManager.formatPaceString(
                            distance: runSessions.last?.distance ?? 0,
                            time: runSessions.last?.duration ?? 0
                        )
                    )
                }
                .padding(.horizontal)
            }

            VStack(spacing: 10) {

            }
        }
        
        RunButton(buttonText: "Back to Home", trailingIcon: "", action: {
            navigationManager.reset()
            runDataManager.resetLocationHistory()
        })
        .padding(.top, 5)
        .padding(.bottom, 55)

    }
}

#Preview {
    SummaryScreen(
        routeId: UUID(),
        runDataManager: RunDataManager(locationManager: MyLocationManager()))
}
