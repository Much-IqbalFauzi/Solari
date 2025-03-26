//
//  RunButton.swift
//  Solari
//
//  Created by Ailsa Anarghia on 26/03/25.
//

import SwiftUI

struct RunButton: View {
    var body: some View {
        VStack{
            Button {
            } label: {
                Label("Select Routes", systemImage: "figure.run")
            }
            .padding()
            .frame(maxWidth: 320, maxHeight: 63)
            .foregroundColor(.black)
            .background(Color(hex: "#D5FF5F"))
            .cornerRadius(15)
        }
        .shadow(color: .gray.opacity(0.5), radius: 3, y: 2)
    }
}

#Preview {
    RunButton()
    
}
