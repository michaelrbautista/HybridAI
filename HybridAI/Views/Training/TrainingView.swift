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
                    StyledButton(
                        variant: .primary,
                        text: "Create Program",
                        isLoading: .constant(false)
                    ) {
                        navigationController.presentSheet(.NewProgramCoordinatorView)
                    }
                    .buttonStyle(.plain)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                } else if userViewModel.isStarted && userViewModel.isInProgress {
                    Text("\(userViewModel.program!.title)")
                } else if userViewModel.isStarted {
                    Text("Program will start next Monday.")
                        .foregroundStyle(Color.ColorSystem.systemGray)
                } else {
                    StyledButton(
                        variant: .primary,
                        text: "Start Program",
                        isLoading: .constant(false)
                    ) {
                        viewModel.startProgram()
                        userViewModel.isStarted = true
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
            
//            Section {
//                if userViewModel.nutritionPlan == nil {
//                    StyledButton(
//                        variant: .secondary,
//                        text: "Create Nutrition Plan",
//                        isLoading: .constant(false)
//                    ) {
//                        navigationController.presentSheet(.NewNutritionPlanView)
//                    }
//                    .buttonStyle(.plain)
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                } else {
//                    NutritionPlanCells(nutritionPlan: userViewModel.nutritionPlan!)
//                        .listRowBackground(Color.ColorSystem.systemBackground)
//                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                }
//            } header: {
//                HStack {
//                    Text("Nutrition")
//                        .font(Font.FontStyles.title3)
//                        .foregroundStyle(Color.ColorSystem.primaryText)
//                    Spacer()
//                }
//                .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
//            }
//            .headerProminence(.increased)
        }
        .listStyle(.insetGrouped)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(Date.now.formatted(date: .abbreviated, time: .omitted))
        .refreshable {
            Task {
                guard let currentUserId = UserService.currentUser?.id else {
                    print("Couldn't get current user.")
                    return
                }
                
                try await userViewModel.getProgramAndNutritionPlan(userId: currentUserId)
                
                viewModel.getStartedProgram()
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
