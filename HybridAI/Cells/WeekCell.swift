//
//  WeekCell.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/4/25.
//

import SwiftUI

struct WeekCell: View {
    
    var weekNumber: Int
    var days: [Day]
    
    var body: some View {
        Section {
            Text("Week \(weekNumber)")
                .font(Font.FontStyles.headline)
                .foregroundStyle(Color.ColorSystem.primaryText)
            
            ForEach(days) { day in
                DayCell(day: day)
            }
        }
    }
}

#Preview {
    WeekCell(weekNumber: 1, days: [Day]())
}
