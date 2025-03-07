//
//  WeeklyLiftsView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/20/25.
//

import SwiftUI

struct WeeklyLiftsView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("How many days a week do you want to lift?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "1",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalLiftsPerWeek = 1
                }
                
                SelectListRow(
                    text: "2",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalLiftsPerWeek = 2
                }
                
                SelectListRow(
                    text: "3",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalLiftsPerWeek = 3
                }
                
                SelectListRow(
                    text: "4",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalLiftsPerWeek = 4
                }
                
                SelectListRow(
                    text: "5",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalLiftsPerWeek = 5
                }
                
                SelectListRow(
                    text: "6",
                    selection: $viewModel.goal
                ) {
                    viewModel.generalLiftsPerWeek = 6
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.generalLiftsPerWeek == 0 ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.ConfiguringView(viewModel: viewModel))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    WeeklyLiftsView(viewModel: OnboardingViewModel())
}
