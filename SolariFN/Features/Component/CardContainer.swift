//
//  Card.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 10/05/25.
//


import SwiftUI

struct CardContainer<Content: View>: View {

    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack {
            content()
        }
        .padding(.bottom, 20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
    }
}
