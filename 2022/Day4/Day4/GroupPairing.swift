//
//  GroupPairing.swift
//  Day4
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

struct GroupPairing {
    let firstGroup: SectionGroup
    let secondGroup: SectionGroup
    
    init(ranges: String) {
        let groupSplit = ranges.split(separator: ",")
        firstGroup = SectionGroup(range: String(groupSplit[0]))
        secondGroup = SectionGroup(range: String(groupSplit[1]))
    }
    
    func doesFullyOverlap() -> Bool {
        if firstGroup.startNum >= secondGroup.startNum
            && firstGroup.endNum <= secondGroup.endNum {
            return true
        }
        if firstGroup.startNum <= secondGroup.startNum
            && firstGroup.endNum >= secondGroup.endNum {
            return true
        }

        return false
    }
    
    func doesPartiallyOverlap() -> Bool {
        return firstGroup.startNum.between(num1: secondGroup.startNum,
                                           num2: secondGroup.endNum)
            || firstGroup.endNum.between(num1: secondGroup.startNum,
                                           num2: secondGroup.endNum)
    }
}
