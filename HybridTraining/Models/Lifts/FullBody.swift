//
//  FullBody.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/17/25.
//

final class FullBody {
    
    public static let shared = FullBody()
    
    // MARK: Create workout
    public func createFullBodyWorkout(hasGymAccess: Bool) -> [[Exercise]] {
        return [
            [
                MainLower.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                Squat.shared.getExercise(hasGymAccess: hasGymAccess),
                Hinge.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                PrimaryPush.shared.getExercise(hasGymAccess: hasGymAccess),
                PrimaryPull.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                UpperAccessoryPull.shared.getExercise(hasGymAccess: hasGymAccess),
                Core.shared.getExercise(hasGymAccess: hasGymAccess)
            ]
        ]
    }
}
