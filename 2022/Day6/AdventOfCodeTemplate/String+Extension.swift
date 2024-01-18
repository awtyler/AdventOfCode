//
//  String+Extension.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/6/23.
//

import Foundation

extension String {
    func hasDuplicates() -> Bool {
        for i in Array(self) {
            if self.count - self.replacingOccurrences(of: String(i), with: "").count >= 2 {
                return true
            }
        }
        return false
    }
}
