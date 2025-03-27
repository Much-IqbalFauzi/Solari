//
//  RunButton.swift
//  Solari
//
//  Created by Ailsa Anarghia on 26/03/25.
//

import SwiftUI

struct RunButton: View {
    var buttonText: String
    
    var body: some View {
        VStack{
            Label(buttonText, systemImage: "figure.run")
                .font(.system(size: 24))
                .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: 320, maxHeight: 65)
            .foregroundColor(.black)
            .background(Color(hex: "#D5FF5F"))
            .cornerRadius(15)
        }
        .shadow(color: .gray.opacity(0.5), radius: 3, y: 2)
    }
}

#Preview {
    RunButton(buttonText: "Select Routes")
    
}
