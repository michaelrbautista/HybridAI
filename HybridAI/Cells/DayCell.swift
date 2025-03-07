//
//  DayCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/4/25.
//

import SwiftUI

struct DayCell: View {
    @EnvironmentObject var navigationController: NavigationController
    
    var day: Day
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 5) {
                Text(day.day.capitalized)
                    .font(Font.FontStyles.footnote)
                    .foregroundStyle(Color.ColorSystem.systemGray)
                
                if day.workouts.count > 0 {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(day.workouts) { workout in
                            WorkoutCell(
                                text: workout.type == "lift" ? "Lift" : "\(workout.distance!) miles"
                            ) {
                                navigationController.push(.WorkoutDetailView(workout: workout))
                            }
                        }
                    }
                } else {
                    HStack {
                        Text("No workouts.")
                            .font(Font.FontStyles.caption1)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray5)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .listRowBackground(Color.ColorSystem.systemRed)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(Color.ColorSystem.systemGray6)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    DayCell(day: Day(day: "monday", workouts: [Workout]()))
}
