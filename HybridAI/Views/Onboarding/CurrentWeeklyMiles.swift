//
//  CurrentWeeklyMiles.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/6/25.
//

import SwiftUI

struct CurrentWeeklyMiles: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("How many miles a week are you comfortable running?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                TextField("Weekly mileage", text: $viewModel.baselineMileage)
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
    CurrentWeeklyMiles(viewModel: OnboardingViewModel())
}
