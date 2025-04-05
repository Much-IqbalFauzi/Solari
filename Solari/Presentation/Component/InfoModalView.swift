//
//  InfoModalView.swift
//  Solari
//
//  Created by Ailsa Anarghia on 05/04/25.
//

import SwiftUI

struct InfoModalView: View {
    
    var titleText: String
    var infoText: String
    
    let images: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TabView {
                            ForEach(images, id: \.self) { name in
                                Image(name)
                                    .resizable()
                                    .renderingMode(.original)
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(height: 220)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            Text(titleText)
                .font(.title2)
                .bold()

            Text(infoText)

            Text("Tap anywhere else to reset the selection.")

            Spacer()
        }
        .padding()
        .presentationBackground(Color(.systemBackground))
    }
}

#Preview {
    InfoModalView(titleText: "title", infoText: "info", images: ["SHORT1"])
}
