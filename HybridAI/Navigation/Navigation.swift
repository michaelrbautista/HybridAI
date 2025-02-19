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
        case .GoalView:
            GoalView()
        case .WeeksView:
            WeeksView()
        case .ExperienceView:
            ExperienceView()
        case .EquipmentView:
            EquipmentView()
        case .ConfiguringView:
            ConfiguringView()
        case .BenefitsView:
            BenefitsView()
        case .CreateAccountView:
            CreateAccountView()
        case .OneTimeCodeView:
            OneTimeCodeView()
        
        // Training
        case .TrainingView:
            TrainingView()
        
        // Programs
        case .ProgramsView:
            ProgramsView()
        case .ProgramDetailView:
            ProgramDetailView()
        case .CalendarView:
            CalendarView()
        case .RunDetailView:
            RunDetailView()
        case .WorkoutDetailView:
            WorkoutDetailView()
        }
    }
    
    // MARK: Sheet views
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .ExerciseDetailView:
            ExerciseDetailView()
        case .StartProgramView:
            StartProgramView()
        case .SettingsView:
            SettingsView()
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .CreateProgram:
            EmptyView()
        }
    }
}
