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
                        .padding(.top, 100)
                    
                    WelcomingTitle()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 500, alignment: .topLeading)
                
                VStack(alignment: .center) {
                    HomeSummaryText()
                        
                    
                    HStack {
                        ForEach(CardSummary.summaries, id: \.summaryType) {
                            summary in summary
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
