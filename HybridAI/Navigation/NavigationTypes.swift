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
    case DaysTrainingView(viewModel: OnboardingViewModel)
    case MultiplePerDayView(viewModel: OnboardingViewModel)
    case BaselineMileageView(viewModel: OnboardingViewModel)
    case LongRunView(viewModel: OnboardingViewModel)
    case GymAccessView(viewModel: OnboardingViewModel)
    case ConfiguringView(viewModel: OnboardingViewModel)
    
    // Auth
    case SignInView
    case CreateAccountView(viewModel: OnboardingViewModel)
    case OneTimeCodeView(isSignIn: Bool, email: String)
    
    // Training
    case TrainingView
    
    // Settings
    case SettingsView
    
    // Programs
    case ProgramDetailView(viewModel: ProgramDetailViewModel)
    case CalendarView(program: Program)
    case WorkoutDetailView(workout: Workout, phase: Week.ProgramPhase)
    
    // New
    case NewProgramView
    case NewlyCreatedProgramView(viewModel: NewProgramViewModel)
    
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
    
    case NewProgramCoordinatorView
    case NewNutritionPlanView
    
    var id: Self { return self }
}

// MARK: Full screen cover
enum FullScreenCover: Identifiable, Hashable {
    case PaywallView(viewModel: OnboardingViewModel, onDismiss: (() -> Void))
    
    var id: Self { return self }
}

extension FullScreenCover {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .PaywallView(_, _):
            hasher.combine("PaywallView")
        }
    }
    
    // Conform to Equatable
    static func == (lhs: FullScreenCover, rhs: FullScreenCover) -> Bool {
        switch (lhs, rhs) {
        case (.PaywallView, .PaywallView):
            return true
        }
    }
}
