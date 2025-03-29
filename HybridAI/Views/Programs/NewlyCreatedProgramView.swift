//
//  NewlyCreatedProgramView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/14/25.
//

import SwiftUI
import SuperwallKit

struct NewlyCreatedProgramView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var sheetNavigationController: SheetNavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var programViewModel: ProgramViewModel
    
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
                // MARK: Workouts
                if userViewModel.isSubscribed {
                    ForEach(weeks, id: \.self) { week in
                        WeekCell(isInSheet: true, weekNumber: week.week, phase: week.phase, days: week.days)
                            .listRowBackground(Color.ColorSystem.systemBackground)
                    }
                } else {
                    if let weekOne = viewModel.newProgram?.content.weeks[0] {
                        WeekCell(isInSheet: false, weekNumber: weekOne.week, phase: weekOne.phase, days: weekOne.days)
                            .listRowBackground(Color.ColorSystem.systemBackground)
                        
                        StyledButton(
                            variant: .primary,
                            text: "Unlock the rest of the program",
                            isLoading: .constant(false)
                        ) {
                            Superwall.shared.register(placement: "campaign_trigger")
                        }
                        .buttonStyle(.plain)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.ColorSystem.systemBackground)
                        
                        Rectangle()
                            .frame(height: 40)
                            .foregroundStyle(Color.ColorSystem.systemBackground)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.ColorSystem.systemBackground)
                    }
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
                        await viewModel.saveNewProgram(currentProgramId: programViewModel.program?.id)
                        
                        if viewModel.returnedError == false {
                            programViewModel.program = viewModel.newProgram
                            
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
