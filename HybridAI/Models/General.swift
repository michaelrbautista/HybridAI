//
//  GeneralStructure.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/16/25.
//

enum GeneralStructure {
    // One day per week
    case OnePerWeekFourDaysAWeek
    case OnePerWeekFiveDaysAWeek
    case OnePerWeekSixDaysAWeek
    
    // Beginner
    case Beginner
    case Intermediate
    case Advanced
    
    var schedule: [[WorkoutType]] {
        switch self {
        case .OnePerWeekFourDaysAWeek:
            return [
                [],
                [WorkoutType.FullBodyPush],
                [WorkoutType.SpeedWorkout],
                [],
                [WorkoutType.FullBodyPull],
                [WorkoutType.LongRun]
            ]
        case .OnePerWeekFiveDaysAWeek:
            return [
                [WorkoutType.EasyRun],
                [WorkoutType.FullBodyPush],
                [WorkoutType.SpeedWorkout],
                [],
                [WorkoutType.FullBodyPull],
                [WorkoutType.LongRun]
            ]
        case .OnePerWeekSixDaysAWeek:
            return [
                [WorkoutType.EasyRun],
                [WorkoutType.FullBodyPush],
                [WorkoutType.SpeedWorkout],
                [WorkoutType.FullBodyPull],
                [WorkoutType.FullBody],
                [WorkoutType.LongRun]
            ]
        
        // Beginner
        case .Beginner:
            return [
                [WorkoutType.EasyRun],
                [WorkoutType.FullBodyPush],
                [WorkoutType.SpeedWorkout],
                [WorkoutType.FullBodyPull],
                [WorkoutType.FullBody],
                [WorkoutType.LongRun]
            ]
        case .Intermediate:
            return [
                [WorkoutType.EasyRun, WorkoutType.FullBodyPush],
                [WorkoutType.EasyRun],
                [WorkoutType.SpeedWorkout, WorkoutType.FullBodyPull],
                [WorkoutType.EasyRun],
                [WorkoutType.FullBody],
                [WorkoutType.LongRun]
            ]
        case .Advanced:
            return [
                [WorkoutType.EasyRun, WorkoutType.FullBodyPush],
                [WorkoutType.EasyRun, WorkoutType.FullBodyPull],
                [WorkoutType.SpeedWorkout, WorkoutType.FullBody],
                [WorkoutType.EasyRun],
                [WorkoutType.EasyRun, WorkoutType.Bodyweight],
                [WorkoutType.LongRun]
            ]
        }
    }
}
