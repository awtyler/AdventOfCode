//
//  String+extension.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/6/23.
//

import Foundation

extension String {
    func split(withSize size: Int) -> [String] {
        var newArr: [String] = []
        var buildStr: String = ""
        for (index, char) in Array(self).enumerated() {
            if index > 0 && index % size == 0 {
                newArr.append(buildStr)
                buildStr = ""
            }
            buildStr = "\(buildStr)\(char)"
        }
        if buildStr != "" {
            newArr.append(buildStr)
        }
        return newArr
    }
}
