//
//  GuardGrid.swift
//  Day6
//
//  Created by Aaron Tyler on 12/10/24.
//

import Foundation

class GuardGrid: GridProtocol {
    typealias GridSpaceType = GuardGridSpace

    var xMax: Int = 0
    var yMax: Int = 0
    var xCount: Int = 0
    var yCount: Int = 0
    var allSpaces: [GuardGridSpace] = []
    var spaces: [[GuardGridSpace]] = []

    required init() {
        
    }
}
