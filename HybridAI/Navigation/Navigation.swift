//
//  Navigation.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

// MARK: Navigation controller
protocol CoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }

    func push(_ screen:  Screen)
    func pop()
    func popToRoot()
    func presentSheet(_ sheet: Sheet)
    func dismissSheet()
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func dismissFullScreenCover()
}

class NavigationController: CoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet? = nil
    @Published var fullScreenCover: FullScreenCover? = nil
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    // MARK: - Screen views
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        // Onboarding
        case .LandingPageView:
            LandingPageView()
        case .ExperienceView:
            ExperienceView()
        case .GoalView(let viewModel):
            GoalView(viewModel: viewModel)
        case .RaceGoalTimeView(let viewModel):
            RaceGoalTimeView(viewModel: viewModel)
        case .PriorityView(let viewModel):
            PriorityView(viewModel: viewModel)
        case .EquipmentView(let viewModel):
            EquipmentView(viewModel: viewModel)
        case .WeeklyRuns(let viewModel):
            WeeklyRunsView(viewModel: viewModel)
        case .CurrentWeeklyMileage(let viewModel):
            CurrentWeeklyMiles(viewModel: viewModel)
        case .WeeklyLifts(let viewModel):
            WeeklyLiftsView(viewModel: viewModel)
        case .ConfiguringView(let viewModel):
            ConfiguringView(viewModel: viewModel)
            
        // Auth
        case .SignInView:
            SignInView()
        case .CreateAccountView(let viewModel):
            CreateAccountView(viewModel: viewModel)
        case .OneTimeCodeView(let isSignIn, let email):
            OneTimeCodeView(isSignIn: isSignIn, email: email)
        
        // Training
        case .TrainingView:
            TrainingView()
        
        // Programs
        case .ProgramDetailView(let viewModel):
            ProgramDetailView(viewModel: viewModel)
        case .CalendarView(let program):
            CalendarView(
                weeks: program.content.weeks.count,
                pages: program.content.weeks.count / 4 + 1
            )
        case .WorkoutDetailView(let workout):
            WorkoutDetailView(workout: workout)
        }
    }
    
    // MARK: Sheet views
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .ExerciseDetailView:
            ExerciseDetailView()
        case .SettingsView:
            SettingsView()
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .CreateProgramView:
            EmptyView()
        case .PaywallView(let viewModel, let onDismiss):
            PaywallView(viewModel: viewModel, onDismiss: onDismiss)
        }
    }
}
