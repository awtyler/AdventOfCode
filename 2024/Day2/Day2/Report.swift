//
//  Report.swift
//  Day2
//
//  Created by Aaron Tyler on 12/2/24.
//

import Foundation

struct Report {
    let levels: [Int]
    
    func isAscending(_ levelSet: [Int]) -> Bool {
        return Set(levelSet).sorted(by: >).map({ String($0) }).joined() == levelSet.map({ String($0) }).joined()
    }
    
    func isDescending(_ levelSet: [Int]) -> Bool {
        return Set(levelSet).sorted(by: <).map({ String($0) }).joined() == levelSet.map({ String($0) }).joined()
    }
    
    func getDiff(_ num1: Int, _ num2: Int) -> Int {
        if num1 > num2 { return num1 - num2 }
        return num2 - num1
    }
    
    func isJumpSafe(_ levelSet: [Int]) -> Bool {
        var prevLevel = levelSet[0]
        for i in 1..<levelSet.count {
            let level = levelSet[i]
            if getDiff(level, prevLevel) > 3 {
                return false
            }
            prevLevel = level
        }
        return true
    }
    
    func isSafe(forLevelSet levelSet: [Int]) -> Bool {
        let safe = (isAscending(levelSet) || isDescending(levelSet)) && isJumpSafe(levelSet)
        
//        print("\(levelSet.map({ String($0) }).joined(separator: " ")) :: \(safe)")
        
        return safe

    }
    
    func isSafe(_ part: ExecutionPart = .part1) -> Bool {
        if part == .part1 {
            return isSafe(forLevelSet: levels)
        } else {
            if isSafe(forLevelSet: levels) {
                return true
            }
                
            for i in 0..<levels.count {
                var levelSet = levels
                levelSet.remove(at: i)
                if isSafe(forLevelSet: levelSet) {
                    return true
                }
            }
            
        }
        return false
    }
    
//    func isPart2Safe() -> Bool {
//        var changesNeeded = 0
//        
//        var isAsc: Bool?
//        print("\(levels.map({ String($0) }).joined(separator: " ")) ::")
//        var prevLevel = levels[0]
//        for i in 1..<levels.count {
//            let curLevel = levels[i]
//            var changeNeeded = false
//            if curLevel > prevLevel {
//                if isAsc == false {
//                    print("     ASC \(isAsc) :: \(prevLevel) \(curLevel)")
//                    changeNeeded = true
//                } else if isAsc == nil {
//                    isAsc = true
//                }
//            } else if curLevel < prevLevel {
//                if isAsc == true {
//                    print("     DSC \(isAsc) :: \(prevLevel) \(curLevel)")
//                    changeNeeded = true
//                } else if isAsc == nil {
//                    isAsc = false
//                }
//            } else {
//                changeNeeded = true
//            }
//            
//            if getDiff(curLevel, prevLevel) > 3 {
//                print("     DIF \(isAsc) :: \(prevLevel) \(curLevel)")
//                changesNeeded += 1
//            }
//            
//            if changeNeeded {
//                changesNeeded += 1
//            } else {
//                prevLevel = curLevel
//            }
//        }
//
//        print("     CHANGES: \(changesNeeded)")
//
//        return changesNeeded <= 1
//    }
}
