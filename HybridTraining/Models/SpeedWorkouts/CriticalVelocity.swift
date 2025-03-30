//
//  CriticalVelocity.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/25/25.
//

import SwiftUI

final class CriticalVelocity {
    
    public static let shared = CriticalVelocity()
    
    public func getCriticalVelocityWorkout(distance: Double) -> RunSegment {
        let workouts = [
            RunSegment(
                segmentType: .Workout,
                description: "400m at critical velocity pace",
                reps: Int(distance * 4)
            ),
            RunSegment(
                segmentType: .Workout,
                description: "800m at critical velocity pace",
                reps: Int(distance * 2)
            ),
            RunSegment(
                segmentType: .Workout,
                description: "1000m at critical velocity pace",
                reps: Int(ceil(distance * 1.75))
            ),
        ]
        
        return workouts.randomElement() ?? RunSegment(
            segmentType: .Workout,
            description: "400m at critical velocity pace",
            reps: Int(distance * 4)
        )
    }
    
}
