//
//  Workout.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/23/25.
//

struct Workout: Codable, Hashable {
    var type: WorkoutType
    
    // Run
    var distance: Int?
    var minutes: Int?
    
    // For speed workout
    var segments: [RunSegment]?
    
    // For lifts
    var exercises: [[Exercise]]?
    
    enum CodingKeys: String, CodingKey {
        case type, distance, minutes, segments, exercises
    }
}

struct RunSegment: Codable, Hashable {
    var segmentType: RunSegmentType
    var distance: Double?
    var duration: Double?
    var description: String
    var reps: Int?
    
    enum RunSegmentType: Codable {
        case Warmup
        case Workout
        case Cooldown
        
        var asString: String {
            switch self {
            case .Warmup:
                return "Warmup"
            case .Workout:
                return "Workout"
            case .Cooldown:
                return "Cooldown"
            }
        }
    }
}

enum WorkoutStructure {
    case One
    case Two
    case Three
    case Four
    case Five
    
    var weeklyStructure: [WorkoutType] {
        switch self {
        case .One:
            return [
                .FullBody
            ]
        case .Two:
            return [
                .UpperBody,
                .LowerBody
            ]
        case .Three:
            return [
                .UpperBody,
                .LowerBody,
                .FullBodyBodyweight
            ]
        case .Four:
            return [
                .UpperBody,
                .LowerBody,
                .UpperBody,
                .FullBodyBodyweight
            ]
        case .Five:
            return [
                .LowerBody,
                .UpperBody,
                .LowerBody,
                .UpperBody,
                .FullBodyBodyweight
            ]
        }
    }
}

enum WorkoutType: Codable {
    // Running
    case EasyRun
    case SpeedWorkout
    case LongRun
    
    enum SpeedWorkoutType {
        case LactateThreshold
        case CriticalVelocity
        
        var asString: String {
            switch self {
            case .LactateThreshold:
                return "Lactate Threshold"
            case .CriticalVelocity:
                return "Critical Velocity"
            }
        }
    }
    
    // Lifts
    case FullBody
    case UpperBody
    case LowerBody
    case FullBodyBodyweight
    
    var asString: String {
        switch self {
        case .EasyRun:
            return "Easy Run"
        case .SpeedWorkout:
            return "Speed Workout"
        case .LongRun:
            return "Long Run"
        case .FullBody:
            return "Full Body Lift"
        case .UpperBody:
            return "Upper Body Lift"
        case .LowerBody:
            return "Lower Body Lift"
        case .FullBodyBodyweight:
            return "Bodyweight Lift"
        }
    }
}
