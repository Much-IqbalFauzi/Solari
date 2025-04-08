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
    @Environment(\.modelContext) private var modelContext
    @Query var runSessions: [RunSession]
    
    var body: some View {
        VStack(spacing: 10) {
            FinishTitle()
            
            VStack() {
                Rectangle()
                    .fill(Color.lightGray)
                    .frame(width: 370, height: 380)
                //ditambahin map trus ada annotations toilet dimana, makanan dimana dll jadi gausah pake foto2 gt
                //sama kotak bawah yg 3 itu disesuaiin aja tempatnya
                
                Text(String("\(runSessions.count) Run Sessions"))
                
                LazyVGrid(columns: columns) {
                    RunResultCard(
                        runResultType: "KM",
                        runResultValue: String(
                            format: "%.2f",
                            runSessions.last?.distance ?? 0
                        )
                    )
                    RunResultCard(runResultType: "Minutes", runResultValue: String(format: "%.2f", runSessions.last?.duration ?? 0))
                    RunResultCard(
                        runResultType: "Min/Km",
                        runResultValue: String(format: "%.2f", runSessions.last?.pace ?? 0)
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
            Text("Go to Home")
                .font(.headline)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.top, 20)
        
    }
}

#Preview {
    SummaryScreen(runDataManager: RunDataManager(locationManager: MyLocationManager()))
}
