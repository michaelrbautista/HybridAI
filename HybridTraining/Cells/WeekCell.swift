//
//  WeekCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/4/25.
//

import SwiftUI

struct WeekCell: View {
    
    var isInSheet: Bool
    var weekNumber: Int
    var phase: Week.ProgramPhase
    var days: [Day]
    
    var body: some View {
        Section {
            Text("Week \(weekNumber)")
                .font(Font.FontStyles.headline)
                .foregroundStyle(Color.ColorSystem.primaryText)
            
            ForEach(days, id: \.self) { day in
                DayCell(isInSheet: isInSheet, day: day, phase: phase)
            }
        }
    }
}

#Preview {
    WeekCell(isInSheet: false, weekNumber: 1, phase: .Base, days: [Day]())
}
