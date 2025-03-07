//
//  WorkoutDetailView.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

struct WorkoutDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var workout: Workout
    
    var body: some View {
        List {
            if workout.type == "lift" {
                Text("Lift")
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
            } else {
                Text("\(workout.distance ?? 1) miles")
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
            }
            
            if let exercises = workout.exercises {
                ForEach(Array(exercises.enumerated()), id: \.offset) { index, exercise in
                    ExerciseCell(exerciseNumber: index + 1, name: exercise.name, sets: exercise.sets, reps: exercise.reps)
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    WorkoutDetailView(workout: Workout(type: "run"))
}
