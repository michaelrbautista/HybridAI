//
//  RaceGoalTimeView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/20/25.
//

import SwiftUI

struct RaceGoalTimeView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("What's your goal time?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            HStack(spacing: 10) {
                HStack {
                    TextField("Hours", text: $viewModel.raceGoalHours)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .keyboardType(.numberPad)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                HStack {
                                    Spacer()
                                    Button("Done") {
                                        hideKeyboard()
                                    }
                                }
                            }
                        }
                }
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(":")
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                HStack {
                    TextField("Minutes", text: $viewModel.raceGoalMinutes)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .keyboardType(.numberPad)
                }
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Spacer()
            VStack(spacing: 10) {
                StyledButton(
                    variant: .secondary,
                    text: "I'm not training for time",
                    isLoading: .constant(false)
                ) {
                    navigationController.push(.EquipmentView(viewModel: viewModel))
                }
                
                StyledButton(
                    variant: viewModel.raceGoalHours == "" || viewModel.raceGoalMinutes == "" ? .disabled : .primary,
                    text: "Next",
                    isLoading: .constant(false)
                ) {
                    navigationController.push(.EquipmentView(viewModel: viewModel))
                }
            }

        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    RaceGoalTimeView(viewModel: OnboardingViewModel())
}
