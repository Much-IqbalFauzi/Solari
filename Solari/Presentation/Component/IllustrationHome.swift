//
//  homeIllustration.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 26/03/25.
//

    
    import SwiftUI

struct IllustrationHome: View {
    var greetingIsNearLocation: Bool = true
    func getImageName() -> String {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        var imageName: String = "farGOP"
        if greetingIsNearLocation {
            imageName = "nearGOP"
        }
        
        switch currentHour {
        case 0..<12:
            return imageName + "-morning"
        case 12..<15:
            return imageName + "-afternoon"
        case 15..<18:
            return imageName + "-evening"
        default:
            return imageName + "-night"
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
