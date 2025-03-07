//
//  PriorityView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/20/25.
//

import SwiftUI

struct PriorityView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("What are you looking to prioritize right now?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "Running",
                    selection: $viewModel.generalPriority
                ) {
                    viewModel.generalPriority = "Running"
                }
                
                SelectListRow(
                    text: "Lifting",
                    selection: $viewModel.generalPriority
                ) {
                    viewModel.generalPriority = "Lifting"
                }
                
                SelectListRow(
                    text: "Both",
                    selection: $viewModel.generalPriority
                ) {
                    viewModel.generalPriority = "Both"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.generalPriority == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.WeeklyRuns(viewModel: viewModel))
            }

        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    PriorityView(viewModel: OnboardingViewModel())
}
