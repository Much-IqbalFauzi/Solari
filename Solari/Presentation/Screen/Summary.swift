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
            FinishTitle()
            
            VStack() {
                Rectangle()
                    .fill(Color.lightGray)
                    .frame(width: 370, height: 380)
                //ditambahin map trus ada annotations toilet dimana, makanan dimana dll jadi gausah pake foto2 gt
                //sama kotak bawah yg 3 itu disesuaiin aja tempatnya
                
                HStack {
                    RunResultCard(runResultType: "KM", runResultValue: String(format: "%.2f", runDataManager.distanceTraveled / 1000))
                    RunResultCard(runResultType: "Minutes", runResultValue: runDataManager.formattedElapsedTime)
                    RunResultCard(
                        runResultType: "Min/Km",
                        runResultValue: runDataManager.formattedPace
                    )
                }
            }
            
            VStack(spacing: 10) {
               
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
    }
#Preview {
    SummaryScreen(runDataManager: RunDataManager(locationManager: MyLocationManager()))
}
