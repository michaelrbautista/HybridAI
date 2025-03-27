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
    
    @Published var isCreating = false
    @Published var isSaving = false
    
    #if DEBUG
    @Published var experience = "Advanced"
    @Published var daysPerWeek = "6"
    @Published var multiplePerDay = "Yes"
    @Published var hasGymAccess = "No"
    @Published var longRunDay = "Saturday"
    #else
    @Published var experience = ""
    @Published var daysPerWeek = ""
    @Published var multiplePerDay = ""
    @Published var hasGymAccess = ""
    @Published var longRunDay = ""
    #endif
    
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    @MainActor
    public func saveNewProgram(currentProgramId: String?) async {
        guard let programContent = self.newProgram?.content, let programTitle = self.newProgram?.title else {
            print("Couldn't get content from newly created program.")
            return
        }
        
        self.isSaving = true
        
        let createProgramRequest = CreateProgramRequest(
            programId: currentProgramId,
            title: programTitle,
            content: programContent
        )
        
        do {
            try await ProgramService.shared.saveProgram(program: createProgramRequest)
        } catch {
            print(error)
            self.returnedError = true
            self.errorMessage = error.localizedDescription
            self.isSaving = false
        }
    }
    
    public func createGeneralProgram() {
        self.isCreating = true
        
        // Create new program
        let programContent = GeneralService.shared.createGeneralProgram(
            experience: experience,
            daysPerWeek: daysPerWeek,
            multiplePerDay: multiplePerDay,
            longRunDay: longRunDay,
            hasGymAccess: hasGymAccess == "No" ? false : true
        )
        
        self.newProgram = Program(id: "", title: "4 Week Program", content: programContent)
    }
}
