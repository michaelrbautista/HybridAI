//
//  LiftService.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/9/25.
//

import SwiftUI

class LiftService {
    
    public static let shared = LiftService()
    
    // MARK: Configure general runs
    public func configureGeneralLifts(weeks: [Week], hasGymAccess: Bool) -> [Week] {
        var newWeeks = [Week]()
        
        for week in weeks {
            var newWeek = Week(week: week.week, phase: week.phase, days: [Day]())
            
            for day in week.days {
                var newDay = Day(day: day.day, workouts: [Workout]())
                
                for workout in day.workouts {
                    switch workout.type {
                    // MARK: Upper body
                    case .UpperBody:
                        let exercises = UpperBody.shared.createUpperBodyWorkout(hasGymAccess: hasGymAccess)
                        let newWorkout = Workout(type: workout.type, exercises: exercises)
                        newDay.workouts.append(newWorkout)
                    // MARK: Lower body
                    case .LowerBody:
                        let exercises = LowerBody.shared.createLowerBodyWorkout(hasGymAccess: hasGymAccess)
                        let newWorkout = Workout(type: workout.type, exercises: exercises)
                        newDay.workouts.append(newWorkout)
                    // MARK: Full body
                    case .FullBody:
                        let exercises = FullBody.shared.createFullBodyWorkout(hasGymAccess: hasGymAccess)
                        let newWorkout = Workout(type: workout.type, exercises: exercises)
                        newDay.workouts.append(newWorkout)
                    // MARK: Full body bodyweight
                    case .FullBodyBodyweight:
                        let exercises = FullBody.shared.createFullBodyWorkout(hasGymAccess: false)
                        let newWorkout = Workout(type: workout.type, exercises: exercises)
                        newDay.workouts.append(newWorkout)
                    default:
                        newDay.workouts.append(workout)
                    }
                }
                
                newWeek.days.append(newDay)
            }
            
            newWeeks.append(newWeek)
        }
        
        return newWeeks
    }
}
