//
//  MultiplePerDayView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/15/25.
//

import SwiftUI

struct MultiplePerDayView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("Do you want to train multiple times a day?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "Yes",
                    selection: $viewModel.multiplePerDay
                ) {
                    viewModel.multiplePerDay = "Yes"
                }
                
                SelectListRow(
                    text: "No",
                    selection: $viewModel.multiplePerDay
                ) {
                    viewModel.multiplePerDay = "No"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.daysPerWeek == "0" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.LongRunView(viewModel: viewModel))
            }

        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    MultiplePerDayView(viewModel: OnboardingViewModel())
}
