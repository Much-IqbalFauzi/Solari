//
//  ContentView.swift
//  SolariWatchOS Watch App
//
//  Created by Destu Cikal Ramdani on 10/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RunButton(
                buttonText: "Run Now",
                trailingIcon: "arrow.forward.circle.fill",
                btnColor: .greenYellow) {
                    print("Running...")
                }
        }
        .padding()
    }
}

#Preview {
   
}
