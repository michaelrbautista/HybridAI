//
//  GeneralService.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/17/25.
//

final class GeneralService {
    
    public static let shared = GeneralService()
    
    // MARK: Create general program
    public func createGeneralProgram(
        // Running
        experience: String,
        daysPerWeek: String,
        multiplePerDay: String,
        longRunDay: String,
        hasGymAccess: Bool
    ) -> ProgramContent {
        // Define structure
        let structure = defineStructure(experience: experience, daysPerWeek: daysPerWeek, multiplePerDay: multiplePerDay)
        
        // Apply to entire program
        let programWeeks = applyStructure(structure: structure, longRunDay: longRunDay)
        
        // Configure runs
        var midWeekRunTime = 25
        var longRunTime = 45
        
        if experience == "Intermediate" {
            midWeekRunTime = 45
            longRunTime = 90
        } else if experience == "Advanced" {
            midWeekRunTime = 60
            longRunTime = 120
        }
        
        let weeksWithRuns = RunService.shared.configureGeneralRuns(weeks: programWeeks, experience: experience, midWeekRunTime: midWeekRunTime, longRunTime: longRunTime)
        
        // Configure lifts
        let weeksWithLifts = LiftService.shared.configureGeneralLifts(weeks: weeksWithRuns, hasGymAccess: hasGymAccess)
        
        return ProgramContent(weeks: weeksWithLifts)
    }
    
    // MARK: Apply structure to entire program
    func applyStructure(structure: [[WorkoutType]], longRunDay: String) -> [Week] {
        var programWeeks = [Week]()
        
        for week in 0..<4 {
            // Phase
            var phase = Week.ProgramPhase.Base
            if week > 3 {
                phase = Week.ProgramPhase.Build
            }
            
            // Create new week
            var newWeek = Week(week: week + 1, phase: phase, days: [])
            
            // Add days to week
            for day in structure {
                var newDay = Day(day: "", workouts: [])
                
                // Add workout to day
                for workout in day {
                    let workout = Workout(type: workout)
                    newDay.workouts.append(workout)
                }
                
                newWeek.days.append(newDay)
            }
            
            // Add rest day
            if longRunDay == "Saturday" {
                newWeek.days.append(Day(day: "", workouts: []))
            } else {
                newWeek.days.insert(Day(day: "", workouts: []), at: 0)
            }
            
            // Set days
            let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
            for day in 0..<newWeek.days.count {
                newWeek.days[day].day = days[day]
            }
            
            programWeeks.append(newWeek)
        }
        
        return programWeeks
    }
    
    // MARK: Define structure
    func defineStructure(experience: String, daysPerWeek: String, multiplePerDay: String) -> [[WorkoutType]] {
        var structure = [[WorkoutType]()]
        
        switch experience {
        case "Beginner":
            if daysPerWeek == "4" {
                structure = GeneralStructure.OnePerWeekFourDaysAWeek.schedule
            } else if daysPerWeek == "5" {
                structure = GeneralStructure.OnePerWeekFiveDaysAWeek.schedule
            } else {
                structure = GeneralStructure.OnePerWeekSixDaysAWeek.schedule
            }
        case "Intermediate":
            structure = GeneralStructure.Intermediate.schedule
            
            if multiplePerDay == "No" {
                if daysPerWeek == "4" {
                    structure = GeneralStructure.OnePerWeekFourDaysAWeek.schedule
                } else if daysPerWeek == "5" {
                    structure = GeneralStructure.OnePerWeekFiveDaysAWeek.schedule
                } else {
                    structure = GeneralStructure.OnePerWeekSixDaysAWeek.schedule
                }
            } else {
                // Adjust for days per week
                if daysPerWeek == "5" {
                    structure[3] = []
                } else if daysPerWeek == "4" {
                    structure[3] = []
                    structure[1] = []
                }
            }
        case "Advanced":
            structure = GeneralStructure.Advanced.schedule
            
            if multiplePerDay == "No" {
                if daysPerWeek == "4" {
                    structure = GeneralStructure.OnePerWeekFourDaysAWeek.schedule
                } else if daysPerWeek == "5" {
                    structure = GeneralStructure.OnePerWeekFiveDaysAWeek.schedule
                } else {
                    structure = GeneralStructure.OnePerWeekSixDaysAWeek.schedule
                }
            } else {
                // Adjust for days per week
                if daysPerWeek == "5" {
                    structure[3] = []
                } else if daysPerWeek == "4" {
                    structure[3] = []
                    structure[1] = []
                }
            }
        default:
            break
        }
        
        return structure
    }
}
