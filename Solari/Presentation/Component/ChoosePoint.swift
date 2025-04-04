//
//  ChoosePoint.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 27/03/25.
//

import SwiftUI

struct ChoosePoint: View {
    private let startPoints: [(name: String, coordinate: (lat: Double, lon: Double))] = [
          ("Point A", (lat: -6.2088, lon: 106.8456)), // Example coordinates (Jakarta)
          ("Point B", (lat: -7.2504, lon: 112.7688))  // Example coordinates (Surabaya)
      ]
    
    @State private var selectedIndex = 0 // Track selected index
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(startPoints.indices, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .fill(Color(.systemGray6))
                            .frame(width: 320, height: 70)
                            .cornerRadius(15)
                        
                        Text(startPoints[index].name)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.primary)
//                            .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(width: 320, height: 95) // Clip frame size: same height and width with inside rect
            .clipShape(RoundedRectangle(cornerRadius: 15) ) // Clipping with roundedRectangle shape
            .shadow(radius: 2, x: 0, y: 2)
        }
    }
}

#Preview {
    ChoosePoint()
}
