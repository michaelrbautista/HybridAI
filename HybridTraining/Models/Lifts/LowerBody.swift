//
//  LowerBody.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/23/25.
//

final class LowerBody {
    
    public static let shared = LowerBody()
    
    // MARK: Create workout
    public func createLowerBodyWorkout(hasGymAccess: Bool) -> [[Exercise]] {
        return [
            [
                MainLower.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                Squat.shared.getExercise(hasGymAccess: hasGymAccess),
                Jump.shared.getExercise(hasGymAccess: hasGymAccess)
            ],
            [
                Hinge.shared.getExercise(hasGymAccess: hasGymAccess),
                LowerAccessory.shared.getExercise()
            ],
            [
                Core.shared.getExercise(hasGymAccess: hasGymAccess)
            ]
        ]
    }
}
