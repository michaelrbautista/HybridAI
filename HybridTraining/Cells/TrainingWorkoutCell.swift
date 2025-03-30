//
//  TrainingWorkoutCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/29/25.
//

import SwiftUI

struct TrainingWorkoutCell: View {
    var workout: Workout
    var action: (() -> Void)
    
    init(workout: Workout, action: @escaping (() -> Void)) {
        self.workout = workout
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                if workout.type == .EasyRun {
                    Text("🏃‍♂️")
                        .font(Font.FontStyles.caption1)
                    
                    if workout.distance != nil {
                        Text("\(workout.distance!) miles easy")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    } else if workout.minutes != nil {
                        Text("\(configureTime(minutes: workout.minutes!))s easy")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                } else if workout.type == .LongRun {
                    Text("🏃‍♂️")
                        .font(Font.FontStyles.caption1)
                    
                    if workout.distance != nil {
                        Text("\(workout.distance!) mile long run")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    } else if workout.minutes != nil {
                        Text("\(configureTime(minutes: workout.minutes!)) long run")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                } else {
                    if workout.type == .SpeedWorkout {
                        Text("🏃‍♂️")
                            .font(Font.FontStyles.headline)
                    } else {
                        Text("🏋️‍♂️")
                            .font(Font.FontStyles.headline)
                    }
                    
                    Text(workout.type.asString)
                        .font(Font.FontStyles.headline)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 10)
                    .foregroundStyle(Color.ColorSystem.systemGray2)
                    .fontWeight(.bold)
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.ColorSystem.systemGray5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
        .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        .listRowSeparator(.hidden)
    }
    
    func configureTime(minutes: Int) -> String {
        if minutes > 60 {
            let hours = minutes / 60
            let minutes = minutes % 60
            if minutes == 0 {
                return "\(hours) hour"
            } else {
                return "\(hours) hour \(minutes) minute"
            }
        } else {
            return "\(minutes) minute"
        }
    }
}

#Preview {
    NavigationStack {
        List {
            TrainingWorkoutCell(workout: Workout(type: .EasyRun, distance: nil, minutes: 45, segments: nil, exercises: nil)) {
                
            }
        }
        .listStyle(.plain)
    }
}
