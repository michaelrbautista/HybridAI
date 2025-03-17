//
//  LiftDetailView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/17/25.
//

import SwiftUI

struct LiftDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var workout: Workout
    
    var body: some View {
        List {
            Text("Lift")
                .font(Font.FontStyles.title1)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .listRowBackground(Color.ColorSystem.systemBackground)
            
            if let exercises = workout.exercises {
                ForEach(Array(exercises.enumerated()), id: \.offset) { index, exercise in
                    ExerciseCell(exerciseNumber: index + 1, name: exercise.name, sets: exercise.sets, reps: exercise.reps)
                        .listRowBackground(Color.ColorSystem.systemBackground)
                }
            }
        }
        .listStyle(.plain)
        .background(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    LiftDetailView(workout: Workout(type: .FullBody))
}
