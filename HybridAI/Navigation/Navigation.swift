//
//  Navigation.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/17/25.
//

import SwiftUI

// MARK: Coordinator protocols
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

// MARK: Navigation controller
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
        case .DaysTrainingView(let viewModel):
            DaysPerWeekTrainingView(viewModel: viewModel)
        case .MultiplePerDayView(let viewModel):
            MultiplePerDayView(viewModel: viewModel)
        case .BaselineMileageView(let viewModel):
            BaselineMileageView(viewModel: viewModel)
        case .LongRunView(let viewModel):
            LongRunView(viewModel: viewModel)
        case .GymAccessView(let viewModel):
            GymAccessView(viewModel: viewModel)
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
            
        // Settings
        case .SettingsView:
            SettingsView()
        
        // Programs
        case .ProgramDetailView(let viewModel):
            ProgramDetailView(viewModel: viewModel)
        case .CalendarView(let program):
            CalendarView(
                weeks: program.content.weeks.count,
                pages: program.content.weeks.count / 4 + 1
            )
        case .WorkoutDetailView(let workout, let phase):
            WorkoutDetailView(workout: workout, phase: phase)
            
        // New
        case .NewProgramView:
            NewProgramView()
        case .NewlyCreatedProgramView(let viewModel):
            NewlyCreatedProgramView(viewModel: viewModel)
        }
    }
    
    // MARK: Sheet views
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .ExerciseDetailView:
            ExerciseDetailView()
        case .NewProgramCoordinatorView:
            NewProgramCoordinatorView()
        case .NewNutritionPlanView:
            NewNutritionPlanView()
        }
    }
    
    // MARK: Fullscreen cover views
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .PaywallView(let viewModel, let onDismiss):
            PaywallView(viewModel: viewModel, onDismiss: onDismiss)
        }
    }
}

// MARK: Sheet coordinator protocols
protocol SheetCoordinatorProtocol: ObservableObject {
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

// MARK: Sheet navigation controller
class SheetNavigationController: CoordinatorProtocol {
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
        case .NewProgramView:
            NewProgramView()
        case .NewlyCreatedProgramView(let viewModel):
            NewlyCreatedProgramView(viewModel: viewModel)
        case .WorkoutDetailView(let workout, let phase):
            WorkoutDetailView(workout: workout, phase: phase)
        default:
            Text("There was an error. Please try again later.")
        }
    }
    
    // MARK: Sheet views
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        default:
            Text("There was an error. Please try again later.")
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        default:
            Text("There was an error. Please try again later.")
        }
    }
}
