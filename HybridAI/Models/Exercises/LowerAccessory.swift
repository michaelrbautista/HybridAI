//
//  LowerAccessory.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/19/25.
//

final class LowerAccessory {
    
    public static let shared = LowerAccessory()
    
    public func getExercise() -> Exercise {
        return exercises.randomElement() ?? Exercise(
            name: "Calf raise",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 2,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 4
        )
    }
    
    let exercises = [
        Exercise(
            name: "Calf raise",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 2,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 4
        ),
        Exercise(
            name: "Bent knee calf raise",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 2,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 4
        ),
        Exercise(
            name: "Tibialis raise",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 2,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 4
        ),
    ]
}
