//
//  TrainingViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

final class TrainingViewModel: ObservableObject {
    
    @Published var program: Program? = nil
    @Published var isStarted = false
    
    @Published var isLoading = true
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    // MARK: Get user's program
    @MainActor
    public func getUserProgram() async {
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
            if let startedProgramId = UserDefaults.standard.value(forKey: "startedProgram") as? String {
                if startedProgramId == program.id {
                    self.isStarted = true
                }
            }
            
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.returnedError = true
            self.errorMessage = error.localizedDescription
        }
    }
}
