//
//  ExerciseCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/4/25.
//

import SwiftUI

struct ExerciseCell: View {
    
    var exercise: Exercise
    
    var body: some View {
        Section {
            VStack {
                Text(exercise.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Text("\(exercise.baseSets) sets")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
                
                Text("\(exercise.baseReps) reps")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            .listRowBackground(Color.ColorSystem.systemGray6)
        }
    }
}

#Preview {
    List {
        ExerciseCell(exercise: Exercise(name: "Test exercise", isSingleLeg: false, baseSets: 0, buildSets: 0, peakSets: 0, raceSets: 0, baseReps: 0, buildReps: 0, peakReps: 0, raceReps: 0))
        
        ExerciseCell(exercise: Exercise(name: "Test exercise", isSingleLeg: false, baseSets: 0, buildSets: 0, peakSets: 0, raceSets: 0, baseReps: 0, buildReps: 0, peakReps: 0, raceReps: 0))
    }
    .listStyle(.insetGrouped)
}
