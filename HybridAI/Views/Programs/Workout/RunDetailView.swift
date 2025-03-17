//
//  RunDetailView.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/17/25.
//

import SwiftUI

struct RunDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var workout: Workout
    
    var body: some View {
        List {
            switch workout.type {
            // MARK: Easy run
            case .EasyRun:
                Text("\(workout.distance) miles")
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .listRowBackground(Color.ColorSystem.systemBackground)
                
                Text("\(workout.distance) miles in zone 2.")
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            // MARK: Speed workout
            case .SpeedWorkout:
                Text("\(3) miles")
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .listRowBackground(Color.ColorSystem.systemBackground)
                
                if let segments = workout.segments {
                    ForEach(Array(segments.enumerated()), id: \.offset) { index, segment in
                        
                    }
                }
            // MARK: Long run
            case .LongRun:
                Text("\(workout.distance) miles")
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .listRowBackground(Color.ColorSystem.systemBackground)
                
                Text("\(workout.distance) miles in zone 2.")
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            default:
                Text("Pushed wrong view.")
            }
        }
        .listStyle(.plain)
        .background(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    RunDetailView(workout: Workout(type: .EasyRun))
}
