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
    var phase: Week.ProgramPhase
    
    var body: some View {
        List {
            Text("\(workout.type.asString)")
                .font(Font.FontStyles.title1)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.ColorSystem.systemBackground)
            
            if let exercises = workout.exercises {
                ForEach(exercises.indices, id: \.self) { index in
                    if exercises[index].count > 1 {
                        SuperSetCell(
                            firstExercise: exercises[index][0],
                            secondExercise: exercises[index][1],
                            sets: exercises[index][0].baseSets
                        )
                    } else {
                        ExerciseCell(exercise: exercises[index][0])
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    LiftDetailView(workout: Workout(type: .FullBody), phase: .Base)
}
