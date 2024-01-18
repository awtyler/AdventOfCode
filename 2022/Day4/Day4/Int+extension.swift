//
//  Int+extension.swift
//  Day4
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

extension Int {
    func between(num1: Int, num2: Int, inclusive: Bool = true) -> Bool {
        let low = [num1, num2].min()!
        let high = [num1, num2].max()!
        if inclusive {
            return self >= low && self <= high
        } else {
            return self > low && self < high
        }
    }
}
