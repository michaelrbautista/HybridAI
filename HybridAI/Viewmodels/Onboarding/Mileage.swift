//
//  Mileage.swift
//  HybridAI
//
//  Created by Michael Bautista on 3/4/25.
//

// MARK: Marathon
enum MarathonStructure {
    case Beginner
    case Intermediate
    case Advanced
    
    var mileage: [Int] {
        switch self {
        case .Beginner:
            return [
                // Base
                3,3,3,0,3,8,0,
                3,3,3,0,3,10,0,
                4,4,4,0,3,10,0,
                4,4,4,0,3,11,0,
                5,5,5,0,3,12,0,
                5,5,5,0,3,11,0,
                // Build
                5,5,5,0,3,14,0,
                5,5,5,0,3,11,0,
                5,5,5,0,3,15,0,
                5,5,5,0,3,11,0,
                // Peak
                6,6,6,0,3,16,0,
                6,6,6,0,3,11,0,
                6,6,6,0,3,18,0,
                // Taper
                6,6,6,0,3,12,0,
                4,4,4,0,3,10,0,
                3,0,6,0,3,2,0,
            ]
        case .Intermediate:
            return [
                // Base
                5,5,5,5,5,10,0,
                5,5,5,5,5,11,0,
                6,6,6,6,5,12,0,
                6,6,6,6,5,13,0,
                7,7,7,7,5,14,0,
                7,7,7,7,5,13,0,
                // Build
                8,8,8,8,5,15,0,
                8,8,8,8,5,13,0,
                8,8,8,8,5,16,0,
                8,8,8,8,5,13,0,
                // Peak
                9,9,9,9,5,18,0,
                9,9,9,9,5,13,0,
                9,9,9,9,5,20,0,
                // Taper
                7,6,7,7,5,13,0,
                6,4,9,6,5,9,0,
                5,0,8,0,4,2,0,
            ]
        case .Advanced:
            return [
                // Base
                5,5,5,5,5,12,0,
                5,5,5,5,5,13,0,
                6,6,6,6,5,14,0,
                6,6,6,6,5,15,0,
                7,7,7,7,5,16,0,
                7,7,7,7,5,15,0,
                // Build
                8,8,8,8,5,18,0,
                8,8,8,8,5,15,0,
                8,8,8,8,5,19,0,
                8,8,8,8,5,15,0,
                // Peak
                9,9,9,9,5,20,0,
                9,9,13,9,5,15,0,
                9,10,10,10,5,22,0,
                // Taper
                7,7,10,10,5,14,0,
                6,6,6,6,5,10,0,
                5,5,8,0,4,2,0,
            ]
        }
    }
}

// MARK: 50k
enum FiftyKStructure {
    case Beginner
    case Intermediate
    case Advanced
    
    var mileage: [Int] {
        switch self {
        case .Beginner:
            return [
                30,0,0,0,
                0,0,0,0,
                0,0,0,0,
                0,0,0,0,
                60,50,40,21
            ]
        case .Intermediate:
            return [
                40,0,0,0,
                0,0,0,0,
                0,0,0,0,
                0,0,0,0,
                70,55,40,21
            ]
        case .Advanced:
            return [
                40,0,0,0,
                0,0,0,0,
                0,0,0,0,
                0,0,0,0,
                80,65,45,21
            ]
        }
    }
    
    var longRuns: [Int] {
        switch self {
        case .Beginner:
            return [
                8,10,11,10,
                12,13,14,12,
                15,12,16,13,
                18,14,10,2
            ]
        case .Intermediate:
            return [
                10,11,12,10,
                13,14,15,12,
                15,16,18,16,
                20,14,10,2
            ]
        case .Advanced:
            return [
                12,13,14,12,
                14,15,16,14,
                16,18,20,16,
                22,14,10,2
            ]
        }
    }
}

enum GeneralStructure {
    case Beginner
    case Intermediate
    case Advanced
    
    
}
