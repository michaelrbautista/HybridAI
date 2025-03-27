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
                if let distance = workout.distance {
                    Section {
                        Text("\(distance) mile run")
                            .font(Font.FontStyles.title1)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowBackground(Color.ColorSystem.systemBackground)
                            .listRowSeparator(.hidden)
                    }
                    
                    Section {
                        Text("\(distance) miles in zone 2.")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowBackground(Color.ColorSystem.systemGray6)
                            .listRowSeparator(.hidden)
                    }
                } else if let minutes = workout.minutes {
                    Text("\(minutes) minute run")
                        .font(Font.FontStyles.title1)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowBackground(Color.ColorSystem.systemBackground)
                        .listRowSeparator(.hidden)
                    
                    Text("\(minutes) minutes in zone 2.")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowBackground(Color.ColorSystem.systemBackground)
                        .listRowSeparator(.hidden)
                }
            // MARK: Speed workout
            case .SpeedWorkout:
                VStack(alignment: .leading, spacing: 10) {
                    Text("Speed Workout")
                        .font(Font.FontStyles.title1)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.ColorSystem.systemBackground)
                .listRowSeparator(.hidden)
                
                Section {
                    if let segments = workout.segments {
                        ForEach(Array(segments.enumerated()), id: \.offset) { index, segment in
                            SegmentCell(segment: segment)
                        }
                    }
                } header: {
                    Text("Segments")
                        .font(Font.FontStyles.title2)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
                .headerProminence(.increased)
            // MARK: Long run
            case .LongRun:
                if let distance = workout.distance {
                    Text("\(distance) mile run")
                        .font(Font.FontStyles.title1)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .listRowBackground(Color.ColorSystem.systemBackground)
                        .listRowSeparator(.hidden)
                    
                    Text("\(distance) miles in zone 2.")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                        .listRowBackground(Color.ColorSystem.systemBackground)
                        .listRowSeparator(.hidden)
                } else if let minutes = workout.minutes {
                    Text("\(minutes) minute run")
                        .font(Font.FontStyles.title1)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .listRowBackground(Color.ColorSystem.systemBackground)
                        .listRowSeparator(.hidden)
                    
                    Text("\(minutes) minutes in zone 2.")
                        .font(Font.FontStyles.body)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                        .listRowBackground(Color.ColorSystem.systemBackground)
                        .listRowSeparator(.hidden)
                }
            default:
                Text("Pushed wrong view.")
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    RunDetailView(workout: Workout(type: .EasyRun, minutes: 60))
}
