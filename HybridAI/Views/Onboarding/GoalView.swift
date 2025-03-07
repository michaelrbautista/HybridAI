//
//  GoalView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct GoalView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("What are you training for?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "General strength and endurance",
                    selection: $viewModel.goal
                ) {
                    viewModel.goal = "General strength and endurance"
                }
                
                SelectListRow(
                    text: "Full marathon",
                    selection: $viewModel.goal
                ) {
                    viewModel.goal = "Full marathon"
                }
                
                SelectListRow(
                    text: "50k ultra",
                    selection: $viewModel.goal,
                    isDisabled: viewModel.experience == "Beginner"
                ) {
                    viewModel.goal = "50k ultra"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.goal == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                if viewModel.goal == "General strength and endurance" {
                    navigationController.push(.PriorityView(viewModel: viewModel))
                } else {
                    navigationController.push(.RaceGoalTimeView(viewModel: viewModel))
                }
            }

        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    GoalView(viewModel: OnboardingViewModel())
}
