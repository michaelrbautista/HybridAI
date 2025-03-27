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
            name: "Calf Raise",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 4
        )
    }
    
    let exercises = [
        Exercise(
            name: "Calf Raise",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 4
        ),
        Exercise(
            name: "Bent Knee Calf Raise",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 4
        ),
        Exercise(
            name: "Tibialis Raise",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 4
        ),
        Exercise(
            name: "Barefoot Pogos",
            isSingleLeg: false,
            baseSets: 5,
            buildSets: 5,
            peakSets: 4,
            raceSets: 4,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        ),
    ]
}
