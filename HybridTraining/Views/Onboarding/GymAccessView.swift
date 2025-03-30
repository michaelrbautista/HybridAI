//
//  GymAccessView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct GymAccessView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("Do you have access to a gym?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "Yes",
                    selection: $viewModel.hasGymAccess
                ) {
                    viewModel.hasGymAccess = "Yes"
                }
                
                SelectListRow(
                    text: "No",
                    selection: $viewModel.hasGymAccess
                ) {
                    viewModel.hasGymAccess = "No"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.hasGymAccess == "" ? .disabled : .primary,
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
    GymAccessView(viewModel: OnboardingViewModel())
}
