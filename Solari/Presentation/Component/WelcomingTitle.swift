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
                return "Good Morning Sobari!"
            case 12..<16:
                return "Good Afternoon Sobari!"
            case 16..<20:
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

        
        
    }
}

#Preview {
    WelcomingTitle()
}
