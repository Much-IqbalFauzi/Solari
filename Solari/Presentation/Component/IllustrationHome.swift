//
//  homeIllustration.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 26/03/25.
//

    
    import SwiftUI

struct IllustrationHome: View {
    func getImageName() -> String {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        switch currentHour {
        case 0..<12:
            return "homeIllustration"
        case 12..<15:
            return "homeIllustration 1"
        case 15..<18:
            return "homeIllustration 2"
        default:
            return "homeIllustration 3"
        }
    }
    
    var body: some View {
        Image(getImageName())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 350)
    }
}
    #Preview {
        IllustrationHome()
    }
