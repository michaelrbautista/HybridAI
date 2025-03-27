//
//  LactateThreshold.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/25/25.
//

import SwiftUI

final class LactateThreshold {
    
    public static let shared = LactateThreshold()
    
    public func getLactateThresholdWorkout(distance: Double) -> RunSegment {
        let workouts = [
            RunSegment(
                segmentType: .Workout,
                description: "20 seconds at tempo pace, 40 seconds at an easy pace",
                reps: 8
            ),
            RunSegment(
                segmentType: .Workout,
                description: "40 seconds at tempo pace, 40 seconds at an easy pace",
                reps: 8
            ),
            RunSegment(
                segmentType: .Workout,
                description: "1 minute at tempo pace, 1 minute at an easy pace",
                reps: 8
            ),
            RunSegment(
                segmentType: .Workout,
                description: "2 minute at tempo pace, 1 minute at an easy pace",
                reps: 4
            ),
            RunSegment(
                segmentType: .Workout,
                description: "\(distance) miles at tempo pace",
                reps: 1
            ),
            RunSegment(
                segmentType: .Workout,
                description: "0.5 miles at tempo pace, 30 seconds at an easy pace",
                reps: Int(distance * 2)
            ),
            RunSegment(
                segmentType: .Workout,
                description: "1 mile at tempo pace, 90 seconds at an easy pace",
                reps: Int(ceil(distance))
            ),
        ]
        
        return workouts.randomElement() ?? RunSegment(
            segmentType: .Workout,
            description: "20 seconds at tempo pace, 40 seconds at an easy pace",
            reps: 8
        )
    }
    
}
