//
//  Summary.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI
import SwiftData

struct SummaryScreen: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var runDataManager: RunDataManager
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @Query(sort: \RunSession.date, order: .forward) var runSessions: [RunSession]
    
    var body: some View {
        VStack(spacing: 10) {
            FinishTitle()
            
            VStack() {
                Rectangle()
                    .fill(Color.lightGray)
                    .frame(width: 370, height: 380)
                
                LazyVGrid(columns: columns) {
                    RunResultCard(
                        runResultType: "Distance",
                        runResultValue: runDataManager.formatDistanceInKM(runSessions.last?.distance ?? 0)
                    )

                    RunResultCard(
                        runResultType: "Duration",
                        runResultValue: runDataManager.formatDuration(runSessions.last?.duration ?? 0)
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
        Button(action: {
            navigationManager.reset()
        }) {
            Text("Back to Home")
                .font(.headline)
                .frame(width: 200, height: 50)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.top, 20)
        
    }
}

#Preview {
    SummaryScreen(runDataManager: RunDataManager(locationManager: MyLocationManager()))
}
