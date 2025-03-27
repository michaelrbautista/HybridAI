//
//  RunService.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/17/25.
//

import SwiftUI

class RunService {
    
    public static let shared = RunService()
    
    // MARK: Configure general runs
    public func configureGeneralRuns(weeks: [Week], experience: String, midWeekRunTime: Int, longRunTime: Int) -> [Week] {
        var previousSpeedSession = WorkoutType.SpeedWorkoutType.LactateThreshold
        
        var newWeeks = [Week]()
        for week in weeks {
            var newWeek = Week(week: week.week, phase: week.phase, days: [])
            
            for day in week.days {
                var newDay = Day(day: day.day, workouts: [])
                
                for workout in 0..<day.workouts.count {
                    if day.workouts[workout].type == .EasyRun {
                        // Easy run
                        newDay.workouts.append(Workout(type: day.workouts[workout].type, minutes: midWeekRunTime))
                    } else if day.workouts[workout].type == .LongRun {
                        // Long run
                        newDay.workouts.append(Workout(type: day.workouts[workout].type, minutes: longRunTime))
                    } else if day.workouts[workout].type == .SpeedWorkout {
                        // Speed workout
                        if previousSpeedSession == .LactateThreshold {
                            // Add speed workout
                            let speedWorkout = createGeneralSpeedWorkout(type: .CriticalVelocity, experience: experience)
                            newDay.workouts.append(speedWorkout)
                            
                            // Switch speed workout next week
                            previousSpeedSession = .CriticalVelocity
                        } else {
                            // Add speed workout
                            let speedWorkout = createGeneralSpeedWorkout(type: .LactateThreshold, experience: experience)
                            newDay.workouts.append(speedWorkout)
                            
                            // Switch speed workout next week
                            previousSpeedSession = .CriticalVelocity
                        }
                    } else {
                        newDay.workouts.append(Workout(type: day.workouts[workout].type))
                    }
                }
                
                newWeek.days.append(newDay)
            }
            
            newWeeks.append(newWeek)
        }
        
        return newWeeks
    }
    
    // MARK: Create general speed workout
    public func createGeneralSpeedWorkout(type: WorkoutType.SpeedWorkoutType, experience: String) -> Workout {
        var warmup = 1.0
        var workout = 2.0
        
        if experience == "Intermediate" {
            warmup = 2.0
            workout = 3.0
        } else if experience == "Advanced" {
            warmup = 2.0
            workout = 4.0
        }
        
        var speedWorkout = Workout(type: .SpeedWorkout, distance: Int((warmup * 2) + workout), segments: [])
        
        let warmupSegment = RunSegment(
            segmentType: .Warmup,
            distance: warmup,
            description: "\(Int(warmup)) mile(s) at an easy pace."
        )
        
        let cooldownSegment = RunSegment(
            segmentType: .Cooldown,
            distance: warmup,
            description: "\(Int(warmup)) mile(s) at an easy pace."
        )
        
        switch type {
        case .CriticalVelocity:
            // Warm up
            speedWorkout.segments?.append(warmupSegment)
            // Workout
            speedWorkout.segments?.append(CriticalVelocity.shared.getCriticalVelocityWorkout(distance: workout))
            // Cool down
            speedWorkout.segments?.append(cooldownSegment)
            break
        case .LactateThreshold:
            // Warm up
            speedWorkout.segments?.append(warmupSegment)
            // Workout
            speedWorkout.segments?.append(LactateThreshold.shared.getLactateThresholdWorkout(distance: workout))
            // Cool down
            speedWorkout.segments?.append(cooldownSegment)
            break
        }
        
        return speedWorkout
    }
    
}
