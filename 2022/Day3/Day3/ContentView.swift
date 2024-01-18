//
//  ContentView.swift
//  Day3
//
//  Created by Aaron Tyler on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var part1Message: String = "Ready to Execute..."
    @State var part2Message: String = "Ready to Execute..."

    var body: some View {
        VStack {
            Text("Day 3").font(.largeTitle)
            
            Spacer()
            
            Text("Part 1").font(.largeTitle)
            Button(action: {
                executePart1()
            }, label: {
                Text("Execute Part 1")
            })
            Text(part1Message)

            Spacer().frame(maxWidth: .infinity, maxHeight: 150)

            Text("Part 2").font(.largeTitle)
            Button(action: {
                executePart2()
            }, label: {
                Text("Execute Part 2")
            })
            Text(part2Message)
            
            Spacer()
        }
        .padding()
    }
    
    func executePart1() {
        var sum = 0
        let rucks = Input.getRucksacks()
        for ruck in rucks {
            sum += ruck.matchingItemPriority
        }
        
        part1Message = "Total of Priorities: \(sum)"
    }
    
    func executePart2() {
        let rucks = Input.getRucksacks()
        var firstGroup = 1
        var maxGroup = rucks.map({ $0.group }).max()!
        var sum = 0
        for groupNum in firstGroup...maxGroup {
            let sacks = rucks.filter { $0.group == groupNum }
            let commonItem = Rucksack.findCommonItem(sacks: sacks)
            sum += Rucksack.getPriority(item: commonItem!)
        }
        
        part2Message = "Total of Group Priorities: \(sum)"
    }
}

//#Preview {
//    ContentView()
//}
