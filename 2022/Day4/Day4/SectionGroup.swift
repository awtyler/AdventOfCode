//
//  SectionGroup.swift
//  Day4
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

struct SectionGroup {
    let startNum: Int
    let endNum: Int
    
    init(range: String) {
        let split = range.split(separator: "-")
        startNum = Int(split[0])!
        endNum = Int(split[1])!
    }
}
