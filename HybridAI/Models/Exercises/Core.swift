//
//  Core.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/19/25.
//

final class Core {
    
    public static let shared = Core()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Hanging Knee Tucks",
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
        } else {
            return bodyweightExercises.randomElement() ?? Exercise(
                name: "Hanging Knee Tucks",
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
            name: "Landmine Rotation",
            isSingleLeg: true,
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
            name: "Weighted Russian Twist",
            isSingleLeg: true,
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
            name: "Kettlebell Halo",
            isSingleLeg: true,
            baseSets: 5,
            buildSets: 5,
            peakSets: 4,
            raceSets: 4,
            baseReps: 8,
            buildReps: 6,
            peakReps: 4,
            raceReps: 4
        ),
        Exercise(
            name: "Hanging Knee Tucks",
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
            name: "Deadbug",
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
            name: "Sit Ups",
            isSingleLeg: false,
            baseSets: 6,
            buildSets: 6,
            peakSets: 5,
            raceSets: 5,
            baseReps: 10,
            buildReps: 8,
            peakReps: 6,
            raceReps: 6
        ),
        Exercise(
            name: "Hanging Knee Tucks",
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
