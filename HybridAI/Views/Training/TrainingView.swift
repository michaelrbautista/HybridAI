//
//  TrainingView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct TrainingView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel = TrainingViewModel()
    
    @State var presentStartProgram = false
    
    var body: some View {
        List {
            Section {
                if userViewModel.program == nil {
                    Text("You haven't started a program yet.")
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                        .listRowSeparator(.hidden)
                } else if userViewModel.isStarted {
                    Text("\(userViewModel.program!.title)")
                } else {
                    StyledButton(
                        variant: .primary,
                        text: "Start Program",
                        isLoading: .constant(false)
                    ) {
                        presentStartProgram.toggle()
                    }
                    .buttonStyle(.plain)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            } header: {
                HStack {
                    Text("Training")
                        .font(Font.FontStyles.title3)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                    Spacer()
                }
                .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
            }
            .headerProminence(.increased)
        }
        .listStyle(.insetGrouped)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(Date.now.formatted(date: .abbreviated, time: .omitted))
        .sheet(isPresented: $presentStartProgram) {
            StartProgramView(
                isStarted: $viewModel.isStarted,
                programId: userViewModel.program!.id,
                weeks: userViewModel.program!.content.weeks.count,
                pages: userViewModel.program!.content.weeks.count / 4 + 1,
                remainder: userViewModel.program!.content.weeks.count % 4
            )
        }
    }
}

#Preview {
    NavigationStack {
        TrainingView()
            .environmentObject(UserViewModel())
    }
}
