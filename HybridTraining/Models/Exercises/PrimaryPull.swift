//
//  PrimaryPull.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/19/25.
//

final class PrimaryPull {
    
    public static let shared = PrimaryPull()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Bent Over Row",
                isSingleLeg: false,
                baseSets: 4,
                buildSets: 4,
                peakSets: 3,
                raceSets: 3,
                baseReps: 10,
                buildReps: 8,
                peakReps: 6,
                raceReps: 6
            )
        } else {
            return bodyweightExercises.randomElement() ?? Exercise(
                name: "Pull Ups",
                isSingleLeg: false,
                baseSets: 4,
                buildSets: 4,
                peakSets: 3,
                raceSets: 3,
                baseReps: 10,
                buildReps: 8,
                peakReps: 6,
                raceReps: 6
            )
        }
    }
    
    let gymExercises = [
        Exercise(
            name: "Bent Over Row",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        ),
        Exercise(
            name: "Seated Cable Row",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        ),
        Exercise(
            name: "Pull Ups",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        ),
        Exercise(
            name: "Chin Ups",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        ),
    ]
    
    let bodyweightExercises = [
        Exercise(
            name: "Pull ups",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        ),
        Exercise(
            name: "Chin ups",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        )
    ]
}
