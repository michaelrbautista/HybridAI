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
    
    @Published var experience = ""
    @Published var goal = ""
    @Published var raceGoalHours = ""
    @Published var raceGoalMinutes = ""
    @Published var baselineMileage = ""
    @Published var generalPriority = ""
    @Published var hasGymAccess = ""
    @Published var availableEquipment = ""
    @Published var generalRunsPerWeek = 0
    @Published var generalLiftsPerWeek = 0
    @Published var raceRunsPerWeek = 0
    @Published var raceLiftsPerWeek = 0
    
    @Published var isConfiguring = true
    @Published var readingBenefits = true
    
    @Published var offering: Offering?
    @Published var selectedPackage: Package?
    
    // MARK: Get subscriptions
    @MainActor
    public func getOfferings() async {
        Purchases.shared.getOfferings { offerings, error in
            if let offer = offerings?.current, error == nil {
                self.offering = offer
                self.selectedPackage = offer.availablePackages.last
            }
        }
    }
}
