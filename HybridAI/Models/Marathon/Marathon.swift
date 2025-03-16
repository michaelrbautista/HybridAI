//
//  Mileage.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/9/25.
//

// MARK: Marathon
enum Marathon {
    case Beginner
    case Intermediate
    case Advanced
    
    var speedWorkouts: [Workout] {
        switch self {
        case .Beginner:
            return [
                Workout(type: "fartlek", distance: 5, segments: [
                    RunSegment(distance: 1, description: "Warm up at an easy pace."),
                    RunSegment(distance: 1, description: "6 sets of 20 seconds at a faster pace, then 40 seconds at an easy pace."),
                    RunSegment(distance: 1, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "fartlek", distance: 5, segments: [
                    RunSegment(distance: 1, description: "Warm up at an easy pace."),
                    RunSegment(distance: 1, description: "6 sets of 30 seconds at a faster pace, then 60 seconds at an easy pace."),
                    RunSegment(distance: 1, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
            ]
        case .Intermediate:
            return [
                Workout(type: "fartlek", distance: 5, segments: [
                    RunSegment(distance: 1, description: "Warm up at an easy pace."),
                    RunSegment(distance: 1, description: "6 sets of 20 seconds at a faster pace, then 40 seconds at an easy pace."),
                    RunSegment(distance: 1, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "fartlek", distance: 5, segments: [
                    RunSegment(distance: 1, description: "Warm up at an easy pace."),
                    RunSegment(distance: 1, description: "6 sets of 30 seconds at a faster pace, then 60 seconds at an easy pace."),
                    RunSegment(distance: 1, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
            ]
        case .Advanced:
            return [
                Workout(type: "fartlek", distance: 5, segments: [
                    RunSegment(distance: 1, description: "Warm up at an easy pace."),
                    RunSegment(distance: 1, description: "6 sets of 20 seconds at a faster pace, then 40 seconds at an easy pace."),
                    RunSegment(distance: 1, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "fartlek", distance: 5, segments: [
                    RunSegment(distance: 1, description: "Warm up at an easy pace."),
                    RunSegment(distance: 1, description: "6 sets of 30 seconds at a faster pace, then 60 seconds at an easy pace."),
                    RunSegment(distance: 1, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Lactate Threshold", distance: 9, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 5, description: "5 miles at 5-10 seconds under your marathon pace."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
                Workout(type: "Critical Velocity", distance: 6, segments: [
                    RunSegment(distance: 2, description: "Warm up at an easy pace."),
                    RunSegment(distance: 2, description: "4 x 800m repeats. Rest 60 seconds between each repeat."),
                    RunSegment(distance: 2, description: "Cool down at an easy pace."),
                ]),
            ]
        }
    }
    
    // Rest day and shakeout runs configured when creating program
    var mileage: [[Int]] {
        switch self {
        case .Beginner:
            return [
                // Base
                [3,3,3,0,3,8],
                [3,3,3,0,3,10],
                [4,4,4,0,3,10],
                [4,4,4,0,3,11],
                [5,5,5,0,3,12],
                [5,5,5,0,3,11],
                // Build
                [5,5,5,0,3,14],
                [5,5,5,0,3,11],
                [5,5,5,0,3,15],
                [5,5,5,0,3,11],
                // Peak
                [6,6,6,0,3,16],
                [6,6,6,0,3,11],
                [6,6,6,0,3,18],
                // Taper
                [6,6,6,0,3,12],
                [4,4,4,0,3,10],
                [3,0,6,0,3,2],
            ]
        case .Intermediate:
            return [
                // Base
                [5,5,5,5,5,10],
                [5,5,5,5,5,11],
                [6,6,6,6,5,12],
                [6,6,6,6,5,13],
                [7,7,7,7,5,14],
                [7,7,7,7,5,13],
                // Build
                [8,8,8,8,5,15],
                [8,8,8,8,5,13],
                [8,8,8,8,5,16],
                [8,8,8,8,5,13],
                // Peak
                [9,9,9,9,5,18],
                [9,9,9,9,5,13],
                [9,9,9,9,5,20],
                // Taper
                [7,6,7,7,5,13],
                [6,4,9,6,5,9],
                [5,0,8,0,4,2],
            ]
        case .Advanced:
            return [
                // Base
                [5,5,5,5,5,12],
                [5,5,5,5,5,13],
                [6,6,6,6,5,14],
                [6,6,6,6,5,15],
                [7,7,7,7,5,16],
                [7,7,7,7,5,15],
                // Build
                [8,8,8,8,5,18],
                [8,8,8,8,5,15],
                [8,8,8,8,5,19],
                [8,8,8,8,5,15],
                // Peak
                [9,9,9,9,5,20],
                [9,9,13,9,5,15],
                [9,10,10,10,5,22],
                // Taper
                [7,7,10,10,5,14],
                [6,6,6,6,5,10],
                [5,5,8,0,4,2],
            ]
        }
    }
}

enum GeneralStructure {
    case Beginner
    case Intermediate
    case Advanced
    
    
}
