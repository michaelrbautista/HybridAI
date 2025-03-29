//
//  OnboardingViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 2/19/25.
//

import SwiftUI
import StoreKit
import RevenueCat

final class OnboardingViewModel: ObservableObject {
    
    @Published var newProgram: Program? = nil
    
    @Published var experience = ""
    @Published var daysPerWeek = ""
    @Published var multiplePerDay = ""
    @Published var baselineMileage = ""
    @Published var hasGymAccess = ""
    @Published var longRunDay = ""
    
    @Published var isConfiguring = true
    @Published var isWaitingForPaywall = true
    
    @Published var isCreating = false
    @Published var isSaving = false
    
    @Published var offering: Offering?
    @Published var selectedPackage: Package?
    
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    // MARK: Get offerings
    @MainActor
    public func getOfferings() async {
        Purchases.shared.getOfferings { offerings, error in
            if let offer = offerings?.current, error == nil {
                self.offering = offer
                self.selectedPackage = offer.availablePackages.last
            }
        }
    }
    
    // MARK: Save program
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
    
    // MARK: Create program
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
