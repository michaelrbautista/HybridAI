//
//  EquipmentView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct EquipmentView: View {
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
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("If not, what do you have access to?")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                    VStack {
                        TextEditor(text: $viewModel.availableEquipment)
                            .frame(maxHeight: 200)
                            .frame(maxWidth: .infinity)
                            .scrollContentBackground(.hidden)
                            .disabled(viewModel.hasGymAccess != "No")
                            .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                    }
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.hasGymAccess == "" ? .disabled : .primary,
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
    EquipmentView(viewModel: OnboardingViewModel())
}
