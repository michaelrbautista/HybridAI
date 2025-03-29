//
//  ProgramViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/28/25.
//

import SwiftUI
import Supabase
import RevenueCat
import SuperwallKit

class ProgramViewModel: ObservableObject {
    
    @Published var program: Program? = nil
    @Published var workouts = [Workout]()
    
    @Published var isLoading = false
    
    @Published var startDate: Date? = nil
    @Published var isStarted = false
    @Published var isInProgress = false
    
    @Published var isSubscribed = false
    @Published var isPastFirstWeek = false
    
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    init() {
        self.isLoading = true
        
        Task {
            await getTrainingProgram()
        }
    }
    
    // MARK: Get program
    @MainActor
    public func getTrainingProgram() async {
        do {
            guard let currentUserId = UserService.currentUser?.id else {
                self.isLoading = false
                self.returnedError = true
                self.errorMessage = "There was an error getting the current user."
                return
            }
            
            let program = try await ProgramService.shared.getProgram(uid: currentUserId)
            
            self.program = program
            
            // Check if user is subscribed
            self.isSubscribed = try await RevenueCatService.shared.checkSubscription()
            
            // Check is user started the program
            self.startDate = UserDefaults.standard.value(forKey: "startDate") as? Date
            
            // Get today's workouts
            if startDate != nil {
                self.isStarted = true
                getStartedProgram()
            }
            
            self.isLoading = false
        } catch {
            self.returnedError = true
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }
    
    // MARK: Get started program
    @MainActor
    public func getStartedProgram() {
        guard let startDate = self.startDate else {
            return
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let daysSinceStarted = calendar.numberOfDaysBetween(startDate, and: Date.now)
        
        if daysSinceStarted < 0 {
            print("HASNT STARTED YET")
            return
        }

        let week = (daysSinceStarted / 7) + 1
        let day = (daysSinceStarted % 7)
        
        if week > 1 {
            self.isPastFirstWeek = true
        }
        
        let workouts = self.program?.content.weeks[week].days[day].workouts
        
        self.workouts = workouts ?? [Workout]()
    }
    
    // MARK: Start program
    @MainActor
    public func startProgram() {
        let date = Date()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        let daysUntilMonday = (9 - weekday) % 7  // 9 ensures Monday (2) is correctly handled
        let nextMonday = calendar.date(byAdding: .day, value: daysUntilMonday == 0 ? 7 : daysUntilMonday, to: date) ?? date
        
        UserDefaults.standard.set(nextMonday, forKey: "startDate")
        
        print(nextMonday)
    }
}
