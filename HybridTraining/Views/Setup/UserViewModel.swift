//
//  UserViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/28/25.
//

import SwiftUI
import Supabase
import RevenueCat
import SuperwallKit

class UserViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var event: AuthChangeEvent? = nil
    @Published var session: Session? = nil
    
    @Published var program: Program? = nil
    @Published var workouts = [Workout]()
    @Published var phase = Week.ProgramPhase.Base
    
    @Published var startDate: Date? = nil
    @Published var isStarted = false
    @Published var isInProgress = false
    
    @Published var isSubscribed = false
    @Published var isPastFirstWeek = false
    
    #if DEBUG
    @Published var nutritionPlan: NutritionPlan? = NutritionPlan(bmr: 1651, protein: 150, fat: 82, carbs: 78)
    #else
    @Published var nutritionPlan: NutritionPlan? = nil
    #endif
    
    init() {
        self.isLoading = true
        
        Task {
            await checkAuth()
        }
    }
    
    // MARK: Get training program
    @MainActor
    public func getTrainingProgram() async {
        do {
            guard let currentUserId = UserService.currentUser?.id else {
                self.isLoading = false
                print("Couldn't get current user.")
                return
            }
            
            let program = try await ProgramService.shared.getProgram(uid: currentUserId)
            
            self.program = program
            
            // Check if user is subscribed
            self.isSubscribed = try await RevenueCatService.shared.checkSubscription()
            print(isSubscribed)
            
            // Check is user started the program
            self.startDate = UserDefaults.standard.value(forKey: "startDate") as? Date
            
            // Get today's workouts
            if startDate != nil {
                self.isStarted = true
                getStartedProgram()
            }
            
            self.isLoading = false
        } catch {
            print("There was an error getting the user's program.")
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
        
        if daysSinceStarted >= 0 {
            self.isInProgress = true
        } else {
            print("Program is not in progress.")
            return
        }

        let week = (daysSinceStarted / 7) + 1
        let day = (daysSinceStarted % 7)
        
        if week > 1 {
            self.isPastFirstWeek = true
        } else {
            self.isPastFirstWeek = false
        }
        
        let workouts = self.program?.content.weeks[week].days[day].workouts
        
        self.workouts = workouts ?? [Workout]()
        
        self.phase = self.program?.content.weeks[week].phase ?? .Base
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
    
    // MARK: Finish program
    @MainActor
    public func finishProgram() {
        UserDefaults.standard.removeObject(forKey: "startDate")
        self.isStarted = false
    }
    
    // MARK: Check auth
    @MainActor
    public func checkAuth() async {
        self.isLoading = true
        
        do {
            let _ = try await SupabaseService.shared.supabase.auth.session
            
            let authUser = try await SupabaseService.shared.supabase.auth.session.user
            
            // Get user from db
            let user: User = try await SupabaseService.shared.supabase
                .from("users")
                .select()
                .eq("id", value: authUser.id)
                .single()
                .execute()
                .value
            
            UserService.currentUser = user
            
            // Get user's program
            await getTrainingProgram()
            
            self.isLoggedIn = true
            self.isLoading = false
        } catch {
            print(error)
            self.isLoggedIn = false
            self.isLoading = false
        }
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}
