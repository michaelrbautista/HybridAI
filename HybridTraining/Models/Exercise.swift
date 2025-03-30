//
//  Exercise.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/23/25.
//

struct Exercise: Codable, Hashable {
    var name: String
    
    var isSingleLeg: Bool
    var time: Int?
    
    var baseSets: Int
    var buildSets: Int
    var peakSets: Int
    var raceSets: Int
    
    var baseReps: Int
    var buildReps: Int
    var peakReps: Int
    var raceReps: Int
}

enum ExerciseType: Codable {
    // Lower body
    case MainLower
    case Squat
    case Hinge
    case LowerAccessory
    
    // Upper body
    case PrimaryPush
    case PrimaryPull
    case SecondaryPush
    case SecondaryPull
    case UpperAccessoryPush
    case UpperAccessoryPull
    
    // Core
    case Core
}
