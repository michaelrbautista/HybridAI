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

struct Week: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var week: Int
    
    var days: [Day]
    
    enum CodingKeys: String, CodingKey {
        case week, days
    }
}

struct Day: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var day: String
    
    var workouts: [Workout]
    
    enum CodingKeys: String, CodingKey {
        case day, workouts
    }
}

struct Workout: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var type: String
    var distance: Int?
    
    // For lifts
    var exercises: [Exercise]?
    
    enum CodingKeys: String, CodingKey {
        case type, distance, exercises
    }
}

struct Exercise: Codable, Hashable {
    var name: String
    var sets: Int
    var reps: Int
}
