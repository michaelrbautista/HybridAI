//
//  ProgramDetailViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

final class ProgramDetailViewModel: ObservableObject {
    
    var programId: String
    var program: Program? = nil
    
    @Published var isSubscribed = false
    
    @Published var isLoading = true
    @Published var isStarted = false
    
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    // MARK: Initializer
    init(programId: String) {
        self.programId = programId
    }
    
    // MARK: Get program
    @MainActor
    public func getProgram() async {
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
            
            // Check if user is subscribed
            self.isSubscribed = try await RevenueCatService.shared.checkSubscription()
            
            // Check is user started the program
            if UserDefaults.standard.value(forKey: "startDate") as? Date != nil {
                self.isStarted = true
            }
            
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.returnedError = true
            self.errorMessage = error.localizedDescription
        }
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
        
        self.isStarted = true
    }
    
    // MARK: Finish program
    @MainActor
    public func finishProgram() {
        UserDefaults.standard.removeObject(forKey: "startDate")
        self.isStarted = false
    }
}
