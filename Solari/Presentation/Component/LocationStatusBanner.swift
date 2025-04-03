//
//  HomeNotification.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 04/04/25.
//

import SwiftUI

public struct LocationStatusBanner: View {
    let isNear: Bool
    
    public var body: some View {
        HStack {
            Image(systemName: isNear ? "checkmark.circle.fill" : "xmark.octagon.fill")
                .foregroundColor(.white)
            Text(isNear ? "You're within range! Start to run" : "You're too far from Green Office Park.")
                .foregroundColor(.white)
                .bold()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(isNear ? Color.green : Color.red)
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.top, 10)
        .transition(.move(edge: .top))
        .animation(.easeInOut, value: isNear)
    }
    
}

#Preview {
    
}
