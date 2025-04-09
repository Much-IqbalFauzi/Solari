//
//  Home.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    
    @StateObject private var locationManager = MyLocationManager()
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var refreshID = UUID()
    @Query var runSessions: [RunSession]
    
    var viewModel: HomeViewModel {
        HomeViewModel(sessions: runSessions)
    }
    
    var body: some View {
        VStack{
            
            ZStack (alignment: .top) {
                IllustrationHome(
                    greetingIsNearLocation: locationManager.isNearLocation
                )
                    .padding(.top, 70)
                VStack {
                    

                    WelcomingTitle()
                    
                    LocationText(
                        greetingIsNearLocation: locationManager.isNearLocation
                    )
                        .padding(.top, -20)
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: 500, alignment: .center)
            
            VStack(alignment: .center) {
                HomeSummaryText()
                    .padding(.top, -90)
                
                
                HStack {
                    ForEach(viewModel.summaries, id: \.summaryType) { summary in
                        summary
                            .padding(.top, -50)
                    }
                }
                
                RunButton(buttonText: "Select Routes", action: {
                    navigationManager.navigate(to: .startPoint)
                })
                .padding(.top, 5)
                .padding(.bottom, 55)
            }
        }
        .id(refreshID)
        .onAppear {
            refreshID = UUID()
        }
    }

}

#Preview {
    HomeScreen()
}
