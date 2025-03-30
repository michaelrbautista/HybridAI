//
//  PrimaryPush.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/19/25.
//

final class PrimaryPush {
    
    public static let shared = PrimaryPush()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Bench press",
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
                name: "Clap Push Ups",
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
            name: "Bench Press",
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
            name: "Incline Bench Press",
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
            name: "Military Press",
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
            name: "Dips",
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
            name: "Clap Push Ups",
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
            name: "Gorilla Push Ups",
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
        )
    ]
}
