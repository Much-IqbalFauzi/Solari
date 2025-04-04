//
//  ChooseMap.swift
//  Solari
//
//  Created by Ailsa Anarghia on 03/04/25.
//

import SwiftUI
struct ChooseMap: View {
    private let startPoints: [(name: String, coordinate: (lat: Double, lon: Double))] = [
              ("Short Run", (lat: -6.2088, lon: 106.8456)), // Example coordinates (Jakarta)
              ("Long Run", (lat: -7.2504, lon: 112.7688))  // Example coordinates (Surabaya)
          ]
        
        @State private var selectedIndex = 0 // Track selected index
        
        var body: some View {

            VStack {
                TabView(selection: $selectedIndex) {
                    ForEach(startPoints.indices, id: \.self) { index in
                        VStack {
                            Text(startPoints[index].name)
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .frame(width: 380, height: 50)
                                    ZStack {
                                        MapComponent()
                                        
                                    }
                                    .tag(index)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(width: 380, height: 480)
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.action
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
                }
                .clipShape(RoundedRectangle(cornerRadius: 15) ) // Clipping with roundedRectangle shape
                
            }
        }

}

#Preview {
    ChooseMap()
}
