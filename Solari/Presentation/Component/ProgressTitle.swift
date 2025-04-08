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
        VStack {
            Text("Run Progress on")
                .font(.title3)
                .fontWeight(.semibold)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
        
    }
}
#Preview {
    ProgressTitle()
}
