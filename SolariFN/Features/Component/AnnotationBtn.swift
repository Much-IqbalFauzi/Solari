//
//  AnnotationBtn.swift
//  SolariFN
//
//  Created by Muchamad Iqbal Fauzi on 15/05/25.
//

import SwiftUI

struct AnnotationBtn: View {

    var btnColor: Color = .fuhciaFever

    var isActive: Bool = false
    var action: () -> Void

    var body: some View {
        ZStack {
            Circle()
                .fill(btnColor)
                .frame(width: 45, height: 45)
                .shadow(color: .gray.opacity(0.5), radius: 5)
            Image(systemName: "mappin.and.ellipse.circle")
                .foregroundColor(Color.whiteCrest)
                .font(.system(size: 35, weight: .semibold))
        }
        .clipShape(Circle())
        .onTapGesture(perform: action)

    }
}

#Preview {
    AnnotationBtn(action: {})
}
