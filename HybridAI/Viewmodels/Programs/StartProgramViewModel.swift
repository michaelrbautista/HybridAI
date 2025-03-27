//
//  StartProgramViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

final class StartProgramViewModel: ObservableObject {
    
    public func startProgram(startDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // "EEEE" gives full day name, e.g., "Monday"
        print(startDate)
        let day = formatter.string(from: startDate)
        
        // Calculate real start date based on entered start date
        // If starting on Friday, real start date should be Monday
        
        var dayAdjustment = 0
        
        switch day {
        case "Tuesday":
            dayAdjustment = -1
        case "Wednesday":
            dayAdjustment = -2
        case "Thursday":
            dayAdjustment = -3
        case "Friday":
            dayAdjustment = -4
        case "Saturday":
            dayAdjustment = -5
        case "Sunday":
            dayAdjustment = -6
        default:
            break
        }
        
        let adjustedStartDate = Calendar.current.date(byAdding: .day, value: dayAdjustment, to: startDate)
        
        UserDefaults.standard.set(adjustedStartDate, forKey: "startDate")
        
//        let calendar = Calendar(identifier: .gregorian)
//        let daysSinceStarted = calendar.numberOfDaysBetween(startDate, and: Date.now)
//        print(daysSinceStarted)
    }
    
}
