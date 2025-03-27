//
//  NewlyCreatedProgramView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/14/25.
//

import SwiftUI

struct NewlyCreatedProgramView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var sheetNavigationController: SheetNavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel: NewProgramViewModel
    
    var body: some View {
        List {
            // MARK: Title
            Text(viewModel.newProgram?.title ?? "Couldn't get program title.")
                .font(Font.FontStyles.title1)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.ColorSystem.systemBackground)
            
            // MARK: Workouts
            if let weeks = viewModel.newProgram?.content.weeks {
                ForEach(weeks, id: \.self) { week in
                    WeekCell(isInSheet: true, weekNumber: week.week, phase: week.phase, days: week.days)
                        .listRowBackground(Color.ColorSystem.systemBackground)
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        guard let currentUserId = UserService.currentUser?.id else {
                            print("Couldn't get current user.")
                            return
                        }
                        
                        await viewModel.saveNewProgram(currentProgramId: userViewModel.program?.id)
                        
                        if viewModel.returnedError == false {
                            userViewModel.program = viewModel.newProgram
                            
                            navigationController.dismissSheet()
                        }
                    }
                } label: {
                    if viewModel.isSaving {
                        ProgressView()
                            .tint(Color.ColorSystem.primaryText)
                    } else {
                        Text("Save")
                    }
                }
                .disabled(viewModel.isSaving)
            }
        })
    }
}

#Preview {
    NewlyCreatedProgramView(viewModel: NewProgramViewModel())
}
