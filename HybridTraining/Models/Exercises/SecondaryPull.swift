//
//  SecondaryPull.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/23/25.
//

final class SecondaryPull {
    
    public static let shared = SecondaryPull()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Single Arm Row",
                isSingleLeg: true,
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
                name: "Neutral Grip Pull Ups",
                isSingleLeg: false,
                baseSets: 5,
                buildSets: 5,
                peakSets: 4,
                raceSets: 4,
                baseReps: 10,
                buildReps: 8,
                peakReps: 6,
                raceReps: 6
            )
        }
    }
    
    let gymExercises = [
        Exercise(
            name: "Single Arm Row",
            isSingleLeg: true,
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
            name: "Face Pull",
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
            name: "Lat Pulldown",
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
            name: "Inverted Row",
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
            name: "Neutral Grip Pull Ups",
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
        Exercise(
            name: "Close Grip Chin Ups",
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
        Exercise(
            name: "Inverted Row",
            isSingleLeg: false,
            baseSets: 5,
            buildSets: 5,
            peakSets: 4,
            raceSets: 4,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        )
    ]
}
