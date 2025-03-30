//
//  SuperSetCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/24/25.
//

import SwiftUI

struct SuperSetCell: View {
    
    var firstExercise: Exercise
    var secondExercise: Exercise
    var sets: Int
    
    var body: some View {
        Section {
            VStack {
                Text(firstExercise.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Text("\(firstExercise.baseReps) reps")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            .listRowBackground(Color.ColorSystem.systemGray6)
            
            VStack {
                Text(secondExercise.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Text("\(secondExercise.baseReps) reps")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            .listRowBackground(Color.ColorSystem.systemGray6)
        } header: {
            if sets == 1 {
                Text("Superset - 1 set")
            } else {
                Text("Superset - \(sets) sets")
            }
        }
    }
}

#Preview {
    List {
        ExerciseCell(exercise: Exercise(name: "Test exercise", isSingleLeg: false, baseSets: 0, buildSets: 0, peakSets: 0, raceSets: 0, baseReps: 0, buildReps: 0, peakReps: 0, raceReps: 0))
        
        SuperSetCell(firstExercise: Exercise(name: "Test exercise", isSingleLeg: false, baseSets: 0, buildSets: 0, peakSets: 0, raceSets: 0, baseReps: 0, buildReps: 0, peakReps: 0, raceReps: 0), secondExercise: Exercise(name: "Test exercise", isSingleLeg: false, baseSets: 0, buildSets: 0, peakSets: 0, raceSets: 0, baseReps: 0, buildReps: 0, peakReps: 0, raceReps: 0), sets: 4)
    }
    .listStyle(.insetGrouped)
}
