//
//  Input.swift
//  Day6
//
//  Created by Aaron Tyler on 11/3/23.
//

enum Input {
    
    enum InputType {
        case sample
        case real
    }

    static var executionPart: ExecutionPart = .part1
    
    static var inputType: InputType = .sample
    
    static var input: String {
        if inputType == .sample {
            return input_sample
        }
        return input_real
    }
    
    static func getInput() -> [Race] {
        let lines = input.split(separator: "\n").map { String($0) }
        let times = lines[0].replacingOccurrences(of: "Time:", with: "").split(separator: " ").map { String($0) }
        let distances = lines[1].replacingOccurrences(of: "Distance:", with: "").split(separator: " ").map { String($0) }

        var races: [Race] = []
        if executionPart == .part1 {
            for i in 0..<times.count {
                races.append(Race(time: Int(times[i])!, target: Int(distances[i])!))
            }
        } else {
            let time = times.joined(separator: "")
            let distance = distances.joined(separator: "")
            races.append(Race(time: Int(time)!, target: Int(distance)!))
        }
        
        return races
    }
    
    static let input_sample = """
    Time:      7  15   30
    Distance:  9  40  200
    """
    
    static let input_real = """
    Time:        60     80     86     76
    Distance:   601   1163   1559   1300
    """
}

enum ExecutionPart {
    case part1
    case part2
}
