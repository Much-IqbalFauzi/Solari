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
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("Solari-Transparent-White")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(textColor)
            
            VStack(alignment: .center) {
                VStack{
                    Text("Distance")
                        .font(.caption)
                        .foregroundColor(textColor)
                    Text(distance)
                        .font(.custom("LeagueGothic-Regular", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(textColor)
                }
                
                VStack {
                    Text("Pace")
                        .font(.caption)
                        .foregroundColor(textColor)
                    Text(pace)
                        .font(.custom("LeagueGothic-Regular", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(textColor)
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
        .frame(maxWidth: 250, alignment: .leading)
        .background(
            showBackground
            ? Color.white.opacity(0.6)
            : Color.clear
        )
        .cornerRadius(showBackground ? 12 : 0)
    }
}

#Preview {
    ShareText(distance: "500 m", pace: "5:12 /km", date: "May 15, 2025")
}
