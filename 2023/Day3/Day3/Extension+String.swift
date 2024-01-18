//
//  Extension+String.swift
//  Day3
//
//  Created by Aaron Tyler on 12/8/23.
//

extension String {
    func toLineArray() -> [String] {
        return self.split(separator: "\n").map { String($0) }
    }
    
    func toXYArray() -> [[String]] {
        return self.split(separator: "\n").map {
            String($0).split(separator: "").map {
                String($0)
            }
        }
    }
}

