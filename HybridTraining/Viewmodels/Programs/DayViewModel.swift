//
//  DayViewModel.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

final class DayViewModel: ObservableObject {
    
    // MARK: Variables
    var programId: String
    var week: Int
    var day: String
    
    var workouts = [Workout]()
    
    @Published var isLoading = true
    
    @Published var didReturnError = false
    @Published var returnedErrorMessage = ""
    
    // MARK: Initializer
    init(programId: String, week: Int, day: String) {
        self.programId = programId
        self.week = week
        self.day = day
    }
}
