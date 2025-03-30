//
//  Squat.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/19/25.
//

final class Squat {
    
    public static let shared = Squat()
    
    public func getExercise(hasGymAccess: Bool) -> Exercise {
        if hasGymAccess {
            return gymExercises.randomElement() ?? Exercise(
                name: "Goblet Squat",
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
                name: "Bodyweight Squat",
                isSingleLeg: false,
                baseSets: 5,
                buildSets: 5,
                peakSets: 4,
                raceSets: 4,
                baseReps: 20,
                buildReps: 16,
                peakReps: 10,
                raceReps: 8
            )
        }
    }
    
    let gymExercises = [
        Exercise(
            name: "Goblet Squat",
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
            name: "ATG Split Squat",
            isSingleLeg: true,
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
            name: "Bulgarian Split Squat",
            isSingleLeg: true,
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
            name: "Weighted Lunge Walk",
            isSingleLeg: true,
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
            name: "Bodyweight Squat",
            isSingleLeg: false,
            baseSets: 5,
            buildSets: 5,
            peakSets: 4,
            raceSets: 4,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 6
        ),
        Exercise(
            name: "Sissy Squat",
            isSingleLeg: false,
            baseSets: 5,
            buildSets: 5,
            peakSets: 4,
            raceSets: 4,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 6
        ),
        Exercise(
            name: "Cossack Squat",
            isSingleLeg: true,
            baseSets: 5,
            buildSets: 5,
            peakSets: 4,
            raceSets: 4,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 6
        ),
        Exercise(
            name: "ATG Split Squat",
            isSingleLeg: true,
            baseSets: 4,
            buildSets: 4,
            peakSets: 3,
            raceSets: 3,
            baseReps: 12,
            buildReps: 10,
            peakReps: 8,
            raceReps: 6
        )
    ]
}
