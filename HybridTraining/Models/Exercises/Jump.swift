//
//  Jump.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/24/25.
//

final class Jump {
    
    public static let shared = Jump()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Box Jump",
                isSingleLeg: false,
                baseSets: 4,
                buildSets: 4,
                peakSets: 3,
                raceSets: 3,
                baseReps: 6,
                buildReps: 5,
                peakReps: 4,
                raceReps: 3
            )
        } else {
            return bodyweightExercises.randomElement() ?? Exercise(
                name: "Squat Jump",
                isSingleLeg: false,
                baseSets: 4,
                buildSets: 4,
                peakSets: 3,
                raceSets: 3,
                baseReps: 8,
                buildReps: 6,
                peakReps: 4,
                raceReps: 4
            )
        }
    }
    
    let gymExercises = [
        Exercise(
            name: "Box Jump",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 6,
            buildReps: 5,
            peakReps: 4,
            raceReps: 3
        ),
        Exercise(
            name: "Depth Jump",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 6,
            buildReps: 5,
            peakReps: 4,
            raceReps: 3
        ),
        Exercise(
            name: "Squat Jump",
            isSingleLeg: false,
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
            name: "Skater Jump",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 8,
            buildReps: 6,
            peakReps: 4,
            raceReps: 4
        )
    ]
    
    let bodyweightExercises = [
        Exercise(
            name: "Squat Jump",
            isSingleLeg: false,
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
            name: "Skater Jump",
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
            name: "Lunge Jump",
            isSingleLeg: false,
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
            name: "Skater Squat Jump",
            isSingleLeg: false,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 6,
            buildReps: 4,
            peakReps: 3,
            raceReps: 3
        )
    ]
}
