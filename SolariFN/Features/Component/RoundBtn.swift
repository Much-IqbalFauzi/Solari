//
//  RoundBtn.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 14/05/25.
//

import SwiftUI

struct RoundBtn: View {

    var icon: String = "pause.fill"
    var btnColor: Color = .hollyGlen

    var isActive: Bool = false
    var action: () -> Void

    var body: some View {
        ZStack {
            Circle()
                .fill(btnColor)
                .frame(width: 75, height: 75)
                .shadow(color: .gray.opacity(0.5), radius: 5)
            Image(systemName: icon)
                .foregroundColor(Color.whiteCrest)
                .font(.system(size: 32, weight: .semibold))
        }.onTapGesture(perform: action)

    }
}

#Preview {
    RoundBtn(icon: "pause.fill", action: {})
}
