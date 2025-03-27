//
//  SecondaryPush.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/23/25.
//

final class SecondaryPush {
    
    public static let shared = SecondaryPush()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Single Arm Shoulder Press",
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
                name: "Incline Push Ups",
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
            name: "Single Arm Overhead Press",
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
            name: "Alternating Dumbbell Bench",
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
            name: "Alternating Incline Dumbbell Bench Press",
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
            name: "Single Arm Landmine Press",
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
    ]
    
    let bodyweightExercises = [
        Exercise(
            name: "Incline Push Ups",
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
            name: "Decline Push Ups",
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
            name: "Knee To Elbow Push Ups",
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
            name: "Pike Push Ups",
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
