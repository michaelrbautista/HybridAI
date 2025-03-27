//
//  TrainingViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

final class TrainingViewModel: ObservableObject {
    
    @Published var program: Program? = nil
    @Published var startDate: Date? = nil
    @Published var isInProgress = false
    
    @Published var nutritionPlan: NutritionPlan? = nil
    
    @Published var isLoading = true
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    // MARK: Get user's program and nutrition plan
    @MainActor
    public func getProgramAndNutritionPlan() async {
        self.isLoading = true
        
        do {
            guard let currentUserId = UserService.currentUser?.id else {
                self.isLoading = false
                self.returnedError = true
                self.errorMessage = "There was an error getting the current user."
                return
            }
            
            let program = try await ProgramService.shared.getProgram(uid: currentUserId)
            
            self.program = program
            
            // Check is user started the program
            self.startDate = UserDefaults.standard.value(forKey: "startDate") as? Date
            
            // Get nutrition plan
            if let usersNutritionPlan = UserDefaults.standard.value(forKey: "nutritionPlan") as? NutritionPlan {
                nutritionPlan = usersNutritionPlan
            }
            
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.returnedError = true
            self.errorMessage = error.localizedDescription
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
        
        let workouts = self.program?.content.weeks[week].days[day].workouts
        
        print(workouts?.count ?? "No workouts")
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

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}
