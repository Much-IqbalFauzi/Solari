//
//  FinishTitle.swift
//  Solari
//
//  Created by Ailsa Anarghia on 27/03/25.
//

import SwiftUI

struct FinishTitle: View {
    func finishTitleAffirmation() -> String {
        let currentHour = Calendar.current.component(.hour, from: Date())
        switch currentHour {
        case 0..<12:
            return "Sobari successfully finished the morning run"
        case 12..<16:
            return "Sobari successfully finished the afternoon run"
        case 16..<20:
            return "Sobari successfully finished the evening run"
        default:
            return "Sobari successfully finished the night run"
        }
    }
    
    
    var body: some View {
        Text("Congratulations!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(3)
            VStack {
                Text(finishTitleAffirmation())
                    .font(.subheadline)
                    .fontWeight(.regular)
        }
    }
}

#Preview {
    FinishTitle()
}
