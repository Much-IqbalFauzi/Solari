//
//  LongRunInfoModal.swift
//  Solari
//
//  Created by Ailsa Anarghia on 05/04/25.
//

import SwiftUI

struct LongRunInfoModal: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Long Run Info")
                .font(.title)
                .bold()
            Text("This is the long run route. It's around 5 kilometers and includes elevation changes for endurance training.")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LongRunInfoModal()
}
