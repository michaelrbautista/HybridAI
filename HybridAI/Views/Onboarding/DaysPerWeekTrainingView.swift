//
//  DaysPerWeekTrainingView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/13/25.
//

import SwiftUI

struct DaysPerWeekTrainingView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("How many days a week do you want to train?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "5",
                    selection: $viewModel.daysPerWeek
                ) {
                    viewModel.daysPerWeek = "5"
                }
                
                SelectListRow(
                    text: "6",
                    selection: $viewModel.daysPerWeek
                ) {
                    viewModel.daysPerWeek = "6"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.daysPerWeek == "0" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.BaselineMileageView(viewModel: viewModel))
            }

        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    DaysPerWeekTrainingView(viewModel: OnboardingViewModel())
}
