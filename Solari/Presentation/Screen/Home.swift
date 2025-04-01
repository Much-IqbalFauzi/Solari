//
//  Home.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var locationManager = MyLocationManager()
    @EnvironmentObject var NavigationManager: NavigationManager
    
    var body: some View {
<<<<<<< HEAD
        NavigationStack {
            VStack{
                ZStack (alignment: .top) {
                    IllustrationHome(greetingIsNearLocation: locationManager.distanceLocation().1)
                        .padding(.top, 65)
                    VStack {
                        
                        WelcomingTitle()
                        
                        LocationText(greetingIsNearLocation: locationManager.distanceLocation().1)
                            .padding(.top, -23)
                    }
                }
                
                .frame(maxWidth: .infinity, maxHeight: 500, alignment: .center)
                
                VStack(alignment: .center) {
                    HomeSummaryText()
                        .padding(.top, -90)
                        
                    
                    HStack {
                        ForEach(CardSummary.summaries, id: \.summaryType) {
                            summary in summary
                                .padding(.top, -50)
                        }
                    }

                    NavigationLink(destination: RouteStartPointScreen()) {
                        RunButton(buttonText: "Select Routes")
                    }
                    .padding(.top, 6)
=======
        VStack{
            ZStack (alignment: .top) {
                IllustrationHome()
                    .padding(.top, 90)
                
                WelcomingTitle(greetingIsNearLocation: locationManager.distanceLocation().1)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 500, alignment: .center)
            
            VStack(alignment: .center) {
                HomeSummaryText()
                    .padding(.top, -50)
                    
                
                HStack {
                    ForEach(CardSummary.summaries, id: \.summaryType) {
                        summary in summary
                            .padding(.top, -25)
                    }
>>>>>>> 7cb8ce1 (new navigation and add some ignore files)
                }

                RunButton(buttonText: "Select Routes", action: {
                    NavigationManager.navigate(to: .startPoint)
                })
                .padding(.top, 5)
            }
            .padding(.top, -50)
        }
    }
}

#Preview {
    HomeScreen()
}
