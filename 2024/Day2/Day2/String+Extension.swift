//
//  String+Extension.swift
//  Day2
//
//  Created by Aaron Tyler on 12/2/24.
//

import Foundation

extension String {
    static func *(_ lhs: String, _ rhs: Int) -> String {
        var str = ""
        for i in 0..<rhs {
            str += lhs
        }
        return str
    }
}
