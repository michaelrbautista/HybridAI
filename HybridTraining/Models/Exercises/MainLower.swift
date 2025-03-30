//
//  MainLower.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/23/25.
//

final class MainLower {
    
    public static let shared = MainLower()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Back Squat",
                isSingleLeg: false,
                baseSets: 4,
                buildSets: 4,
                peakSets: 3,
                raceSets: 3,
                baseReps: 10,
                buildReps: 8,
                peakReps: 6,
                raceReps: 5
            )
        } else {
            return bodyweightExercises.randomElement() ?? Exercise(
                name: "Broad Jump",
                isSingleLeg: false,
                baseSets: 4,
                buildSets: 3,
                peakSets: 2,
                raceSets: 2,
                baseReps: 4,
                buildReps: 3,
                peakReps: 2,
                raceReps: 2
            )
        }
    }
    
    let gymExercises = [
        Exercise(
            name: "Back Squat",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 5
        ),
        Exercise(
            name: "Front Squat",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 5
        ),
        Exercise(
            name: "Hip Thrust",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 5
        ),
        Exercise(
            name: "RDL",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 5
        )
    ]
    
    let bodyweightExercises = [
        Exercise(
            name: "Broad Jump",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 4,
            buildReps: 3,
            peakReps: 2,
            raceReps: 2
        ),
        Exercise(
            name: "Single Leg Broad Jump",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 4,
            buildReps: 3,
            peakReps: 2,
            raceReps: 2
        ),
        Exercise(
            name: "Lateral Broad Jump",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 4,
            buildReps: 3,
            peakReps: 2,
            raceReps: 2
        ),
        Exercise(
            name: "Single Leg Sliding Hamstring Curl",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 6,
            buildReps: 5,
            peakReps: 4,
            raceReps: 4
        )
    ]
    
}
