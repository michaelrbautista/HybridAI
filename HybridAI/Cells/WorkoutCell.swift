//
//  WorkoutCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

struct WorkoutCell: View {
    
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
                        Text("\(workout.distance!) Miles Easy")
                            .font(Font.FontStyles.caption1)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    } else if workout.minutes != nil {
                        Text("\(configureTime(minutes: workout.minutes!))s Easy")
                            .font(Font.FontStyles.caption1)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                } else if workout.type == .LongRun {
                    Text("🏃‍♂️")
                        .font(Font.FontStyles.caption1)
                    
                    if workout.distance != nil {
                        Text("\(workout.distance!) Mile Long Run")
                            .font(Font.FontStyles.caption1)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    } else if workout.minutes != nil {
                        Text("\(configureTime(minutes: workout.minutes!)) Long Run")
                            .font(Font.FontStyles.caption1)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                } else {
                    if workout.type == .SpeedWorkout {
                        Text("🏃‍♂️")
                            .font(Font.FontStyles.caption1)
                    } else {
                        Text("🏋️‍♂️")
                            .font(Font.FontStyles.caption1)
                    }
                    
                    Text(workout.type.asString)
                        .font(Font.FontStyles.caption1)
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
    }
    
    func configureTime(minutes: Int) -> String {
        if minutes > 60 {
            let hours = minutes / 60
            let minutes = minutes % 60
            if minutes == 0 {
                return "\(hours) Hour"
            } else {
                return "\(hours) Hour \(minutes) Minute"
            }
        } else {
            return "\(minutes) Minute"
        }
    }
}

#Preview {
    NavigationStack {
        List {
            WorkoutCell(workout: Workout(type: .EasyRun, distance: nil, minutes: 45, segments: nil, exercises: nil)) {
                
            }
        }
        .listStyle(.plain)
    }
}
