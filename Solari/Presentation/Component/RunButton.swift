//
//  RunButton.swift
//  Solari
//
//  Created by Ailsa Anarghia on 26/03/25.
//

import SwiftUI

struct RunButton: View {
    var buttonText: String
    var trailingIcon: String = "figure.run"
    var btnColor: Color = .greenYellow
    
    var body: some View {
        VStack{
            Label(buttonText, systemImage: trailingIcon)
                .font(.system(size: 24))
                .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: 320, maxHeight: 65)
            .foregroundColor(.black)
            .background(btnColor)
            .cornerRadius(15)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(
                        .shadow(
                            .inner(
                                color: .lightGray.opacity(0.5),

                                radius: 0.5,
                                x: -1,
                                y: 1
                            )
                        )
                    )
                    .foregroundStyle(btnColor)
            )

        }
        .shadow(color: .gray.opacity(0.5), radius: 3, y: 2)
    }
}

#Preview {
    RunButton(buttonText: "Select Routes")
}
