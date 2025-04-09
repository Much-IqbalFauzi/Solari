//
//  ProgressTitle.swift
//  Solari
//
//  Created by Ailsa Anarghia on 27/03/25.
//

import SwiftUI

struct ProgressTitle: View {
    var title: String = ""
    var body: some View {
        HStack {
            Text("Route Progress")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            Spacer()
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
        }
        
    }
}
#Preview {
    ProgressTitle(title: "Long Run")
}
