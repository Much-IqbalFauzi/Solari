//
//  SquareButton.swift
//  Solari
//
//  Created by Muchamad Iqbal Fauzi on 06/04/25.
//

import SwiftUI

struct SquareButton: View {
    var buttonText: String
    var trailingIcon: String = "figure.run"
    var btnColor: Color = .greenYellow
    var isActive: Bool = false
    var action: () -> Void = {}
    
    var body: some View {
        SwiftUI.Button(action: action) {
            VStack{
                Text(buttonText)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                .padding()
                .frame(maxWidth: 100, maxHeight: 65)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(15)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(isActive ? btnColor : .black, lineWidth: 10)
                )

            }
        }.padding([.horizontal], 10)
    }
}

#Preview {
    SquareButton(buttonText: "A", isActive: true)
}
