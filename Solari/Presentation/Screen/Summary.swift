//
//  Summary.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct SummaryScreen: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var runDataManager: RunDataManager

    var body: some View {
        VStack(spacing: 10) {
            Text("Congratulations!")
                .font(.largeTitle)
                .bold()
            
            HStack(alignment: .top) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 185, height: 410)
                
                Spacer()
                
                VStack {
                    RunResultCard(runResultType: "KM", runResultValue: String(format: "%.2f", runDataManager.distanceTraveled / 1000))
                    RunResultCard(runResultType: "Minutes", runResultValue: runDataManager.formattedElapsedTime)
                    RunResultCard(
                        runResultType: "Min/Km",
                        runResultValue: runDataManager.formattedPace
                    )
                }
            }
            
            VStack(spacing: 10) {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 380, height: 80)
                
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 115, height: 170)
                    
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 115, height: 170)
                    
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 115, height: 170)
                }
            }
            Button(action: {
                navigationManager.navigate(to: .home)
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
        .padding()
    }
}

#Preview {
    SummaryScreen(runDataManager: RunDataManager(locationManager: MyLocationManager()))
}
