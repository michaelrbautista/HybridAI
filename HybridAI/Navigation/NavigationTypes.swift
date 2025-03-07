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
    case LandingPageView
    case ExperienceView
    case GoalView(viewModel: OnboardingViewModel)
    case RaceGoalTimeView(viewModel: OnboardingViewModel)
    case PriorityView(viewModel: OnboardingViewModel)
    case EquipmentView(viewModel: OnboardingViewModel)
    case WeeklyRuns(viewModel: OnboardingViewModel)
    case CurrentWeeklyMileage(viewModel: OnboardingViewModel)
    case WeeklyLifts(viewModel: OnboardingViewModel)
    case ConfiguringView(viewModel: OnboardingViewModel)
    
    // Auth
    case SignInView
    case CreateAccountView(viewModel: OnboardingViewModel)
    case OneTimeCodeView(isSignIn: Bool, email: String)
    
    // Training
    case TrainingView
    
    // Programs
    case ProgramDetailView(viewModel: ProgramDetailViewModel)
    case CalendarView(program: Program)
    case WorkoutDetailView(workout: Workout)
    
    var id: Self { return self }
}

extension Screen {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .OneTimeCodeView:
            hasher.combine("OneTimeCodeView")
        default:
            break
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        switch (lhs, rhs) {
        case (.OneTimeCodeView, .OneTimeCodeView):
            return true
        default:
            return true
        }
    }
}

// MARK: Sheet
enum Sheet: Identifiable, Hashable {
    
    case ExerciseDetailView
    case SettingsView
    
    var id: Self { return self }
}

// MARK: Full screen cover
enum FullScreenCover: Identifiable, Hashable {
    case CreateProgramView
    case PaywallView(viewModel: OnboardingViewModel, onDismiss: (() -> Void))
    
    var id: Self { return self }
}

extension FullScreenCover {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .PaywallView(_, _):
            hasher.combine("PaywallView")
        default:
            break
        }
    }
    
    // Conform to Equatable
    static func == (lhs: FullScreenCover, rhs: FullScreenCover) -> Bool {
        switch (lhs, rhs) {
        case (.PaywallView, .PaywallView):
            return true
        default:
            return true
        }
    }
}
