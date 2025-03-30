//
//  TrainingView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI
import SuperwallKit

struct TrainingView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        List {
            TrainingContentView()
            
            #if DEBUG
            Section {
                Button {
                    let calendar = Calendar.current
                    let startDate = calendar.date(byAdding: .day, value: -2, to: Date.now)
                    UserDefaults.standard.set(startDate, forKey: "startDate")
                } label: {
                    Text("Change to first week")
                }
            }
            
            Section {
                Button {
                    let calendar = Calendar.current
                    let startDate = calendar.date(byAdding: .day, value: -10, to: Date.now)
                    UserDefaults.standard.set(startDate, forKey: "startDate")
                } label: {
                    Text("Change to second week")
                }
            }
            #endif
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(Date.now.formatted(date: .abbreviated, time: .omitted))
        .refreshable {
            Task {
                await userViewModel.getTrainingProgram()
            }
        }
    }
}

#Preview {
    NavigationStack {
        TrainingView()
            .environmentObject(UserViewModel())
    }
}
