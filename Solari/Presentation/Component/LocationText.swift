//
//  LocationText.swift
//  Solari
//
//  Created by Ailsa Anarghia on 31/03/25.
//

import SwiftUI

struct LocationText: View {
    var greetingIsNearLocation: Bool = true
    func getGreetingMessage() -> String {
        if (!greetingIsNearLocation) {
            return "Oops! You're far from GOP"
            
        }
        return ""
        
    }
    var body: some View {
        Text(getGreetingMessage())
            .font(.system(size: 16))
            .foregroundColor(.secondary)
            .padding(3)
    }
}

#Preview {
    LocationText()
}
