//
//  ShareText.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 15/05/25.
//

import SwiftUI

struct ShareText: View {
    var distance: String
    var pace: String
    var date: String
    var textColor: Color = Color.white
    var showBackground: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("🏃‍♂️ Run Today")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(textColor)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Distance")
                        .font(.caption)
                        .foregroundColor(textColor)
                    Text(distance)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(textColor)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Pace")
                        .font(.caption)
                        .foregroundColor(textColor)
                    Text(pace)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(textColor)
                }
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
