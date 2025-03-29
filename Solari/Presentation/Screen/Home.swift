//
//  Home.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct HomeScreen: View {
    
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack (alignment: .top) {
                    IllustrationHome()
                        .padding(.top, 90)
                    
                    WelcomingTitle()
                    
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
                    }
                    

                    NavigationLink(destination: RouteStartPointScreen()) {
                        RunButton(buttonText: "Select Routes")
                    }
                    .padding(.top, 5)
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
