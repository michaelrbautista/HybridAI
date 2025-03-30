//
//  Hinge.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/19/25.
//

final class Hinge {
    
    public static let shared = Hinge()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Nordic Hamstring Curl",
                isSingleLeg: false,
                baseSets: 3,
                buildSets: 3,
                peakSets: 2,
                raceSets: 2,
                baseReps: 6,
                buildReps: 5,
                peakReps: 3,
                raceReps: 3
            )
        } else {
            return bodyweightExercises.randomElement() ?? Exercise(
                name: "Cossack Good Morning",
                isSingleLeg: true,
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
    }
    
    let gymExercises = [
        Exercise(
            name: "Nordic Hamstring Curl",
            isSingleLeg: false,
            baseSets: 3,
            buildSets: 3,
            peakSets: 2,
            raceSets: 2,
            baseReps: 6,
            buildReps: 5,
            peakReps: 3,
            raceReps: 3
        ),
        Exercise(
            name: "Single Leg RDL",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 8,
            buildReps: 6,
            peakReps: 4,
            raceReps: 4
        ),
        Exercise(
            name: "Single Leg Hip Thrust",
            isSingleLeg: true,
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
            name: "Kettlebell Swings",
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
    
    let bodyweightExercises = [
        Exercise(
            name: "Cossack Good Morning",
            isSingleLeg: true,
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
            name: "Single Leg RDL",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 8,
            buildReps: 6,
            peakReps: 4,
            raceReps: 4
        ),
        Exercise(
            name: "Single Leg Glute Bridge",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 8,
            buildReps: 6,
            peakReps: 4,
            raceReps: 4
        ),
        Exercise(
            name: "Kickstand Squat",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 4
        )
    ]
}
