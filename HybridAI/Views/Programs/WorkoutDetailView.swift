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
    var phase: Week.ProgramPhase
    
    var body: some View {
        if workout.type == .EasyRun || workout.type == .SpeedWorkout || workout.type == .LongRun {
            RunDetailView(workout: workout)
        } else {
            LiftDetailView(workout: workout, phase: phase)
        }
    }
}

#Preview {
    WorkoutDetailView(workout: Workout(type: .FullBody), phase: .Base)
}
