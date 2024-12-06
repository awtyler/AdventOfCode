//
//  ReportUpdate.swift
//  Day5
//
//  Created by Aaron Tyler on 12/5/24.
//

import Foundation

class ReportUpdate {
    var pages: [Int]
    
    init(_ pages: [Int]) {
        self.pages = pages
    }
    
    init(_ input: String) {
        pages = input.tokensToIntArray(separator: ",")
    }
    
    func getMiddle() -> Int {
        return pages[pages.count / 2]
    }
    
    func isValid(forRules rules: [PageRule], list inputList: [Int]? = nil) -> Bool {
        let list = inputList ?? self.pages
        
        for rule in rules {
            if !rule.isValid(forPageList: list) {
                return false
            }
        }
        return true
    }
    
    func fixOrder(forRules rules: [PageRule], doRandomly: Bool = false) {
        if isValid(forRules: rules) { return }
        
        if doRandomly {
            while !isValid(forRules: rules) {
                pages = pages.shuffled()
            }
            return
        }
        
        var newPageList: [Int] = []
        
        for page in pages {
            if newPageList == [] {
                newPageList.append(page)
            } else {
                var tryList = newPageList
                appendLoop: for i in 0...newPageList.count {
                    tryList.insert(page, at: i)
                    if isValid(forRules: rules, list: tryList) {
                        newPageList = tryList
                        break appendLoop
                    } else {
                        tryList = newPageList
                    }
                }
            }
        }
        pages = newPageList
    }
}
