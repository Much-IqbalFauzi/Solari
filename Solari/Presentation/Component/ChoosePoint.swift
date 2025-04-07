//
//  ChoosePoint.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 27/03/25.
//

import SwiftUI

struct ChoosePoint: View {
    var buttonText: String
    var isActive: Bool = false
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black) // Font color stays black
                .frame(width: 100, height: 60) // Rectangle size
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(isActive ? Color.greenYellow : Color(.systemGray4)) // Light gray for unselected
                        .shadow(radius: 2, x: 0, y: 2) // Shadow effect
                )
        }
    }
}

//#Preview {
//    ChoosePoint()
//}
