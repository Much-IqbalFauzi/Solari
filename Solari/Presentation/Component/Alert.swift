//
//  Alert.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 04/04/25.
//

import SwiftUI

public struct Alert: View {

    public var body: some View {
        Text("You're too far from Green Office Park.")
            .foregroundColor(.white)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
    }

}

#Preview {
    Alert()
}
