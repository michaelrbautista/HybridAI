//
//  Program.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/18/25.
//

struct Program: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    
    var workouts: [Workout]
}

struct Workout: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    
    // For run
    var segment: [Segment]?
    
    // For lift
    var exercises: [Exercise]?
}

struct Segment: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    var reps: Int?
    var distance: String?
}

struct Exercise: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var description: String
    var sets: Int
    var reps: Int
}
