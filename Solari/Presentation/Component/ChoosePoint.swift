//
//  ChoosePoint.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 27/03/25.
//

import SwiftUI

struct ChoosePoint: View {
    private let startPoints: [(name: String, coordinate: (lat: Double, lon: Double))] = [
        ("Point A", (lat: -6.2088, lon: 106.8456)), // Jakarta
        ("Point B", (lat: -7.2504, lon: 112.7688)), // Surabaya
        ("Point C", (lat: -6.9147, lon: 107.6098))  // Bandung
    ]
    
    @State private var selectedIndex = 0 // Track selected index
    
    var body: some View {
           VStack {
               HStack(spacing: 10) {
                   ForEach(startPoints.indices, id: \.self) { index in
                       Button(action: {
                           selectedIndex = index
                       }) {
                           Text(String(startPoints[index].name.last!))
                               .font(.title2)
                               .fontWeight(.bold)
                               .foregroundColor(.black) // Font color stays black
                               .frame(width: 100, height: 60) // Rectangle size
                               .background(
                                   RoundedRectangle(cornerRadius: 15)
                                       .fill(selectedIndex == index ? Color.greenYellow : Color(.systemGray4)) // Light gray for unselected
                                       .shadow(radius: 2, x: 0, y: 2) // Shadow effect
                               )
                       }
                   }
               }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ChoosePoint()
}
