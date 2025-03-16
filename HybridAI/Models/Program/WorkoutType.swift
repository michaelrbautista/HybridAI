//
//  ProgramElements.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/16/25.
//

enum ProgramPhase {
    case Base
    case Build
    case Peak
    case Race
}

enum WorkoutType {
    // Running
    case EasyRun
    case LactateThreshold
    case CriticalVelocity
    case LongRun
    
    // Lifts
    case FullBody
    case FullBodyPush
    case FullBodyPull
    case LowerBodyPush
    case LowerBodyPull
    case UpperBodyPush
    case UpperBodyPull
    case Bodyweight
    
    var createWorkout: Workout {
        switch self {
        case .EasyRun:
            let workout = Workout(type: "run")
            
            return workout
        case .LactateThreshold:
            let workout = Workout(type: "run")
            
            
            
            return workout
        case .CriticalVelocity:
            let workout = Workout(type: "run")
            
            
            
            return workout
        case .LongRun:
            let workout = Workout(type: "run")
            
            
            
            return workout
        case .FullBody:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        case .FullBodyPush:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        case .FullBodyPull:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        case .LowerBodyPush:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        case .LowerBodyPull:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        case .UpperBodyPush:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        case .UpperBodyPull:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        case .Bodyweight:
            let workout = Workout(type: "lift")
            
            
            
            return workout
        }
    }
    
    var asString: String {
        switch self {
        case .EasyRun:
            return "Easy run"
        case .LactateThreshold:
            return "Lactate threshold"
        case .CriticalVelocity:
            return "Critical velocity"
        case .LongRun:
            return "Long run"
        case .FullBody:
            return "Full body"
        case .FullBodyPush:
            return "Full body push"
        case .FullBodyPull:
            return "Full body pull"
        case .LowerBodyPush:
            return "Lower body push"
        case .LowerBodyPull:
            return "Lower body pull"
        case .UpperBodyPush:
            return "Upper body push"
        case .UpperBodyPull:
            return "Upper body pull"
        case .Bodyweight:
            return "Bodyweight lift"
        }
    }
}
