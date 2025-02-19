//
//  NavigationTypes.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

// MARK: Screen
enum Screen: Identifiable, Hashable {
    // Onboarding
    case GoalView
    case WeeksView
    case ExperienceView
    case EquipmentView
    case ConfiguringView
    case BenefitsView
    case CreateAccountView
    case OneTimeCodeView
    
    // Training
    case TrainingView
    
    // Programs
    case ProgramsView
    case ProgramDetailView
    case CalendarView
    case RunDetailView
    case WorkoutDetailView
    
    var id: Self { return self }
}

// MARK: Sheet
enum Sheet: Identifiable, Hashable {
    
    case ExerciseDetailView
    case StartProgramView
    case SettingsView
    
    var id: Self { return self }
}

// MARK: Full screen cover
enum FullScreenCover: Identifiable, Hashable {
    case CreateProgram
    
    var id: Self { return self }
}
