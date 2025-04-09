//
//  RunControlButton.swift
//  Solari
//
//  Created by Destu Cikal Ramdani on 04/04/25.
//
import SwiftUI

struct RunControlButtons: View {
    @ObservedObject var runDataManager: RunDataManager
    @Binding var showingStopAlert: Bool
    @EnvironmentObject var navigationManager: NavigationManager
    
    var cancel: () -> Void = {}
    var finish: () -> Void = {}

    var body: some View {
        HStack(spacing: 10) {
            Button(runDataManager.isPaused ? "Continue" : "Pause") {
                runDataManager.isPaused ? runDataManager.resumeRun() : runDataManager.pauseRun()
            }
            .frame(width: 120, height: 50)
            .background(runDataManager.isPaused ? Color.green : Color.orange)
            .cornerRadius(8)

            Button("Stop Run") {
                showingStopAlert = true
            }
            .alert("End Run?", isPresented: $showingStopAlert) {
                Button("Finish", role: .destructive) {
                    finish()
//                    runDataManager.stopRun()
//                    navigationManager.navigate(to: .summary, with: runDataManager)
                }
                Button("Cancel", role: .cancel) {
                    cancel()
//                    runDataManager.cancelRun()
//                    navigationManager.reset()
                }
            } message: {
                Text("Do you want to finish and save your run, or cancel it?")
            }
            .frame(width: 120, height: 50)
            .background(Color.red)
            .cornerRadius(8)
        }
        .foregroundColor(.white)
        .padding(.top)
    }
}
