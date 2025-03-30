//
//  GoalView.swift
//  HybridTraining
//
//  Created by Michael Bautista on 3/30/25.
//

import SwiftUI

struct GoalView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            Text("What are you training for?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 40) {
                SelectListRow(
                    text: "General strength and endurance",
                    selection: $viewModel.goal
                ) {
                    viewModel.experience = "General strength and endurance"
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("COMING SOON")
                            .font(Font.FontStyles.caption1)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        
                        HStack {
                            Text("Hyrox")
                                .font(Font.FontStyles.headline)
                                .foregroundStyle(Color.ColorSystem.systemGray)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.ColorSystem.systemGray6)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    HStack {
                        Text("Half marathon")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        Text("Marathon")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        Text("50k ultramarathon")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        Text("50 mile ultramarathon")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.goal == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.ExperienceView(viewModel: viewModel))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    GoalView()
}
