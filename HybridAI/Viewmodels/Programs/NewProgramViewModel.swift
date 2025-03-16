//
//  NewProgramViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/7/25.
//

import SwiftUI
import StoreKit
import RevenueCat

final class NewProgramViewModel: ObservableObject {
    
    @Published var newProgram: Program? = nil
    
    #if DEBUG
    @Published var experience = "Advanced"
    @Published var daysPerWeek = "6"
    @Published var baselineMileage = "40"
    @Published var hasGymAccess = "No"
    @Published var longRunDay = "Saturday"
    #else
    @Published var experience = ""
    @Published var daysPerWeek = ""
    @Published var baselineMileage = ""
    @Published var hasGymAccess = ""
    @Published var longRunDay = ""
    #endif
    
    public func createProgram() {
        // Create new program
        let programContent = ProgramService.shared.createGeneralProgram(
            experience: experience,
            daysPerWeek: daysPerWeek,
            baselineMileage: baselineMileage,
            longRunDay: longRunDay,
            hasGymAccess: hasGymAccess
        )
        
        print()
        print("Program content:")
        
        for day in programContent.weeks[0].days {
            print(day)
            print()
        }
        
        newProgram = Program(id: "", title: "8 Week Program", content: programContent)
    }
}
