//
//  WeeklyRunsView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/20/25.
//

import SwiftUI

struct WeeklyRunsView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("How many days a week do you want to run?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "3",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalRunsPerWeek = 3
                }
                
                SelectListRow(
                    text: "4",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalRunsPerWeek = 4
                }
                
                SelectListRow(
                    text: "5",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalRunsPerWeek = 5
                }
                
                SelectListRow(
                    text: "6",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalRunsPerWeek = 6
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.generalRunsPerWeek == 0 ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.CurrentWeeklyMileage(viewModel: viewModel))
            }

        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    WeeklyRunsView(viewModel: OnboardingViewModel())
}
