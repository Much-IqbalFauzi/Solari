//
//  ShareText.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 15/05/25.
//

import SwiftUI
import CoreLocation

struct ShareText: View {
    var distance: String
    var pace: String
    var date: String
    var textColor: Color = Color.white
    var showBackground: Bool = false
    var coordinates: [CLLocationCoordinate2D] = []
    var iconName: String
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image(iconName)
                .resizable()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .center, spacing: 0) {
                VStack{
                    Text("Distance")
                        .font(.caption)
                        .foregroundColor(textColor)
                    
                    Text(distance)
                        .font(.custom("LeagueGothic-Regular", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(textColor)
                    
                    Text("km")
                        .font(.custom("LeagueGothic-Regular", size: 17))
                        .foregroundColor(textColor)
                        .padding(.bottom, 10)
                }
                .padding(.bottom, 10)
                
                VStack {
                    Text("Pace")
                        .font(.caption)
                        .foregroundColor(textColor)
                    
                        Text(pace)
                            .font(.custom("LeagueGothic-Regular", size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(textColor)
                        Text("min/km")
                            .font(.custom("LeagueGothic-Regular", size: 17))
                            .foregroundColor(textColor)
                            .padding(.bottom, 10)
                }
                
                // Replace with polyline route
                RouteShape(coordinates: coordinates)
                    .stroke(textColor, lineWidth: 2)
                    .frame(width: 120, height: 100)
                    .padding(.top, 4)
                
            }
            
            Text(date)
                .font(.caption)
                .foregroundColor(textColor)
        }
        .padding(12)
        .frame(maxWidth: 160, alignment: .center)
        .background(
            showBackground
            ? Color.white.opacity(0.3)
            : Color.clear
        )
        .cornerRadius(showBackground ? 12 : 0)
    }
}

#Preview {
    ShareText(
        distance: "500",
        pace: "5:12",
        date: "May 15, 2025",
        iconName: "Solari-Transparent-White"
    )
}
