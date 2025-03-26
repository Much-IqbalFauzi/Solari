//
//  Home.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 25/03/25.
//

import SwiftUI

struct HomeScreen: View {
    
    
    var body: some View {
        VStack{
            ZStack (alignment: .topLeading) {
                IllustrationHome()
                    .padding(.top, 100)
                
                WelcomingTitle()
                
            }
            .frame(maxWidth: .infinity, maxHeight: 500, alignment: .topLeading)
            HStack {
                ForEach(CardSummary.summaries, id: \.summaryType) { summary in
                        summary
                }
            }
            
            RunButton()
            
        }
    }
}

#Preview {
    HomeScreen()
}
