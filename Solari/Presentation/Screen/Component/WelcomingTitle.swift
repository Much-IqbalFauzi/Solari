//
//  WelcomingTitle.swift
//  Solari
//
//  Created by Ailsa Anarghia on 26/03/25.
//

import SwiftUI

struct WelcomingTitle: View {
    
    func getGreetingMessage() -> String {
            let currentHour = Calendar.current.component(.hour, from: Date())
            
            switch currentHour {
            case 0..<12:
                return "Good MorningSobari!"
            case 12..<17:
                return "Good Afternoon Sobari!"
            case 17..<21:
                return "Good Evening Sobari!"
            default:
                return "Good Night Sobari!"
            }
        }
    
    var body: some View {
        VStack {
            Text(getGreetingMessage())
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
        }
        .offset(x:-5,y:0)
        
        
    }
}

#Preview {
    WelcomingTitle()
}
