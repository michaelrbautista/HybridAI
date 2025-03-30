//
//  UpperBody.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/23/25.
//

final class UpperBody {
    
    public static let shared = UpperBody()
    
    // MARK: Create workout
    public func createUpperBodyWorkout(hasGymAccess: Bool) -> [[Exercise]] {
        return [
            [
                PrimaryPush.shared.getExercise(hasGymAccess: hasGymAccess),
                PrimaryPull.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                SecondaryPush.shared.getExercise(hasGymAccess: hasGymAccess),
                SecondaryPull.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                UpperAccessoryPush.shared.getExercise(hasGymAccess: hasGymAccess),
                UpperAccessoryPull.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                Core.shared.getExercise(hasGymAccess: hasGymAccess)
            ]
        ]
    }
}
