//
//  Home.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 09/05/25.
//

import SwiftUI


struct Home: View {
    @EnvironmentObject private var navigation: Navigation
    var body: some View {
        Text("Hello, World!")
        Button("Go to Select Route") {
            
            navigation.navigate(to: .selectRoute)
        }
    }
}
