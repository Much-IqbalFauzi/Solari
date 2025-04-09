//
//  InfoModalView.swift
//  Solari
//
//  Created by Ailsa Anarghia on 05/04/25.
//

import SwiftUI

struct InfoModalView: View {
    
    @State var titleText: String
    var infoText: String
    
    let images: [String]
    
    @State private var currentIndex = 0
       private let timerInterval: TimeInterval = 2.5
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                          TabView(selection: $currentIndex) {
                              ForEach(0..<images.count, id: \.self) { index in
                                  Image(images[index])
                                      .resizable()
                                      .renderingMode(.original)
                                      .scaledToFill()
                                      .frame(height: 200)
                                      .clipped()
                                      .cornerRadius(10)
                                      .padding(.horizontal)
                                      .tag(index)
                              }
                          }
                          .frame(height: 220)
                          .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                          .onAppear {
                              startImageLoop()
                          }
                
                Text(titleText)
                    .font(.title2)
                    .bold()
                
                Text(infoText)
                
                Spacer(minLength: 40) 
            }
            .padding()
        }
        .presentationDetents([.fraction(1.0)])
        .presentationBackground(Color(.systemBackground))
    }
    private func startImageLoop() {
           Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { _ in
               // Increment the index and loop back to 0 after reaching the last image
               currentIndex = (currentIndex + 1) % images.count
           }
       }
   }
