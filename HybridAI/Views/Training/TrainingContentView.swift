//
//  TrainingContentView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/28/25.
//

import SwiftUI
import SuperwallKit

struct TrainingContentView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        Section {
            if userViewModel.program == nil {
                StyledButton(
                    variant: .primary,
                    text: "Create Program",
                    isLoading: .constant(false)
                ) {
                    navigationController.presentSheet(.NewProgramCoordinatorView)
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                
            } else if !userViewModel.isStarted {
                StyledButton(
                    variant: .primary,
                    text: "Start Program",
                    isLoading: .constant(false)
                ) {
                    userViewModel.isStarted = true
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            } else if !userViewModel.isInProgress {
                Text("Program will start next Monday.")
                    .foregroundStyle(Color.ColorSystem.systemGray)
            } else {
                if !userViewModel.isSubscribed && userViewModel.isPastFirstWeek {
                    Text("You've completed the first week of your program.")
                        .foregroundStyle(Color.ColorSystem.systemGray)
                    
                    Button {
                        Superwall.shared.register(placement: "campaign_trigger")
                    } label: {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Unlock the rest of your program")
                                .font(Font.FontStyles.headline)
                                .foregroundStyle(Color.ColorSystem.primaryText)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.ColorSystem.systemBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                } else {
                    ForEach(userViewModel.workouts, id: \.self) { workout in
                        TrainingWorkoutCell(workout: workout) {
                            navigationController.push(.WorkoutDetailView(workout: workout, phase: .Base))
                        }
                    }
                }
            }
        } header: {
            HStack {
                Text("Training")
                    .font(Font.FontStyles.title3)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                Spacer()
            }
            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        }
        .headerProminence(.increased)
    }
}

#Preview {
    TrainingContentView()
}
