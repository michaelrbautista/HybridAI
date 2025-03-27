//
//  Program.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/18/25.
//

import Foundation

struct CreateProgramRequest: Codable, Hashable {
    var programId: String?
    var title: String
    var content: ProgramContent
    
    enum CodingKeys: String, CodingKey {
        case title, content
        case programId = "id"
    }
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
    var phase: ProgramPhase
    
    enum ProgramPhase: Codable {
        case Base
        case Build
        case Peak
        case Race
    }
    
    var days: [Day]
    
    enum CodingKeys: String, CodingKey {
        case week, phase, days
    }
}

struct Day: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var day: String
    
    var workouts: [Workout]
    
    enum CodingKeys: String, CodingKey {
        case id, day, workouts
    }
}
