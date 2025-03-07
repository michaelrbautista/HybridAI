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
            
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.returnedError = true
            self.errorMessage = error.localizedDescription
        }
    }
    
    // MARK: Finish program
    @MainActor
    public func finishProgram() {
        UserDefaults.standard.removeObject(forKey: "startedProgram")
        UserDefaults.standard.removeObject(forKey: "startDayAsNumber")
        UserDefaults.standard.removeObject(forKey: "startDate")
        self.isStarted = false
    }
}
