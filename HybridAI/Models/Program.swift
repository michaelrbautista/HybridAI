//
//  Program.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/18/25.
//

import Foundation

struct CreateProgramRequest: Codable, Hashable {
    var title: String
    var content: ProgramContent
}

struct Program: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var content: ProgramContent
    
    enum CodingKeys: String, CodingKey {
        case id, title, content
    }
}

struct ProgramContent: Codable, Hashable {
    var weeks: [Week]
}

struct Week: Codable, Hashable {
    var week: Int
    var phase: String
    
    var days: [Day]
    
    enum CodingKeys: String, CodingKey {
        case week, phase, days
    }
}

struct Day: Codable, Hashable {
    var day: String
    
    var workouts: [Workout]
    
    enum CodingKeys: String, CodingKey {
        case day, workouts
    }
}

struct Workout: Codable, Hashable {
    var type: String
    
    // Run
    var distance: Int?
    
    // For speed workout
    var segments: [RunSegment]?
    
    // For lifts
    var exercises: [Exercise]?
    
    enum CodingKeys: String, CodingKey {
        case type, distance, exercises
    }
}

struct RunSegment: Codable, Hashable {
    var distance: Double
    var description: String
}

struct Exercise: Codable, Hashable {
    var name: String
    var sets: Int
    var reps: Int
}
