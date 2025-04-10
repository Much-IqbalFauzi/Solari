//
//  Alert.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 04/04/25.
//

import SwiftUI

public struct Alert: View {
    var title: String
    var type: Color = .red
    public var body: some View {
        Text(title)
            .foregroundColor(.white)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(type)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
    }
}

#Preview {
    Alert(title: "You're too far from Green Office Park.")
}
