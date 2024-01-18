//
//  Schematic.swift
//  Day3
//
//  Created by Aaron Tyler on 12/8/23.
//

import Foundation

struct Schematic {
    let schematicMap: [[String]]
    
    init(schematicMap: [[String]]) {
        self.schematicMap = schematicMap
        print("Schematic Map Row 0: ", schematicMap[0])
    }
    
    var cols: Int { schematicMap.count }
    var rows: Int { schematicMap[0].count }
    
    func isPartNumber(_ x: Int, _ y: Int) -> Bool {
        guard isNumber(x, y) else { return false }
        var retval = false
        retval = retval || isSpecialCharacter(x - 1, y - 1)
        retval = retval || isSpecialCharacter(x - 1, y)
        retval = retval || isSpecialCharacter(x - 1, y + 1)
        retval = retval || isSpecialCharacter(x + 1, y - 1)
        retval = retval || isSpecialCharacter(x + 1, y)
        retval = retval || isSpecialCharacter(x + 1, y + 1)
        retval = retval || isSpecialCharacter(x, y - 1)
        retval = retval || isSpecialCharacter(x, y + 1)
        return retval
    }
    
    func getRowSum(_ y: Int) -> Int {
        var done = false
        var x = 0
        var sum = 0
        while !done {
            if let result = getNumWithRange(x, y) {
                print("Result: ", result)
                if result.isPartNum {
                    sum += result.value
                }
                x = result.maxX + 2
            } else {
                x += 1
            }
            
            if x > schematicMap.count {
                done = true
            }
        }
        return sum
    }
    
    func getGearRatios() -> [GearRatio] {
        var ratios: [GearRatio] = []

        for x in 0..<cols {
            for y in 0..<rows {
                if let gr = getGearRatio(x, y) {
                    print("Adding ratio: ", gr, gr.ratio)
                    ratios.append(gr)
                }
            }
        }
        
        return ratios
    }
    
    func getGearRatio(_ x: Int, _ y: Int) -> GearRatio? {
        guard getCharacter(x, y) == "*" else { return nil }
        
        print("Found * at: ", x, y)

        var numRanges = Set<NumberRange>()

        //ABC
        //D*F
        //GHI
        if let range = getNumWithRange(x - 1 , y - 1) { numRanges.insert(range) }   //A
        if let range = getNumWithRange(x     , y - 1) { numRanges.insert(range) }   //B
        if let range = getNumWithRange(x + 1 , y - 1) { numRanges.insert(range) }   //C
        if let range = getNumWithRange(x - 1 , y)     { numRanges.insert(range) }   //D
        if let range = getNumWithRange(x + 1 , y)     { numRanges.insert(range) }   //F
        if let range = getNumWithRange(x - 1 , y + 1) { numRanges.insert(range) }   //G
        if let range = getNumWithRange(x     , y + 1) { numRanges.insert(range) }   //H
        if let range = getNumWithRange(x + 1 , y + 1) { numRanges.insert(range) }   //I

        if numRanges.count == 2 {
            let num1 = numRanges.popFirst()!.value
            let num2 = numRanges.popFirst()!.value
            return GearRatio(firstNumber: num1, secondNumber: num2)
        }
        
        return nil
    }
    
    func getNumWithRange(_ x: Int, _ y: Int) -> NumberRange? {
        guard x >= 0 && y >= 0 && isNumber(x, y) else { return nil }
        
        var isPartNum = false
        var curX = x
        var done = false
        
        // Get first number into curX
        while !done {
            if curX < 0 {
                curX += 1
                done = true
            } else if isNumber(curX, y) {
                curX -= 1
            } else {
                curX += 1
                done = true
            }
        }
        
        let minX = curX
        
        done = false
        var num = ""
        while !done {
            if curX < cols && isNumber(curX, y) {
                num += getCharacter(curX, y) ?? ""
                isPartNum = isPartNum || isPartNumber(curX, y)
                curX += 1
            } else {
                done = true
                curX -= 1
            }
        }
        
        let maxX = curX
        let value = Int(num) ?? 0
        
        let retval = NumberRange(value: value, isPartNum: isPartNum, minX: minX, maxX: maxX)
//        print("getNum: ", retval)
        
        return retval
    }
    
    func getNum(_ x: Int, _ y: Int) -> (value: Int, nextX: Int) {
        guard x >= 0 && y >= 0 && isPartNumber(x, y) else {
            return (value: 0, nextX: x + 1)
        }
        
        var done = false
        var getX = x
        var str = "\(x)"
        while !done {
            if let char = getCharacter(getX, y), isNumber(getX, y) {
                str += char
                getX += 1
            } else {
                done = true
            }
        }
        print("Value: \(str) / nextX: \(getX)")
        return (value: Int(str) ?? 0, nextX: getX)
    }
    
    func isSpecialCharacter(_ x: Int, _ y: Int) -> Bool {
        if x < 0 || y < 0 {
            return false
        }
        
        guard let char = getCharacter(x, y) else { return false }
        if ".0123456789abcdefghijklmnopqrstuvwxyz".localizedCaseInsensitiveContains(char) {
            return false
        }
        return true
    }
    
    func isNumber(_ x: Int, _ y: Int) -> Bool {
        guard let char = getCharacter(x, y) else { return false }
        return "0123456789".localizedCaseInsensitiveContains(char)
    }
    
    func getCharacter(_ x: Int, _ y: Int) -> String? {
        guard x < cols && y < rows else { return nil }
        return schematicMap[y][x]
    }
}
