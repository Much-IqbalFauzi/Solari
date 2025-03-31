//
//  Test.swift
//  Solari
//
//  Created by Ailsa Anarghia on 29/03/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isRaining = false // Set dynamically if using real data
    
    var body: some View {
        VStack {
            Image(isRaining ? "raining" : "dry") // Change image based on rain condition
                .resizable()
                .scaledToFit()
                .frame(height: 250) // Adjust height as needed
            
            Text(isRaining ? "It's raining, stay dry!" : "Enjoy the clear skies!")
                .font(.headline)
                .padding()
            
            Button("Toggle Weather") {
                isRaining.toggle() // Simulate rain for testing
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
