//
//  DayView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/3/25.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @Binding var workouts: [Workout]
    
    var body: some View {
        Section {
            if workouts.count == 0 {
//                WorkoutCell(text: "No workouts.") {
//                    
//                }
            } else {
                ForEach(workouts, id: \.self) { workout in
                    
//                    WorkoutCell(text: "Workout") {
//                        
//                    }
                }
            }
        } header: {
            HStack {
                Text("Workouts")
                    .font(Font.FontStyles.title3)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        }
        .headerProminence(.increased)
    }
}

#Preview {
    DayView(workouts:.constant([Workout]()))
}
