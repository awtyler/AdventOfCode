//
//  ContentView.swift
//  Day5
//
//  Created by Aaron Tyler on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var part1Message: String = "Ready to Execute..."
    @State var part2Message: String = "Ready to Execute..."

    var body: some View {
        VStack {
            Text("Day 5").font(.largeTitle)
            
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
        var sum = Int.max
        
        let mappingList = Input.getInput()
        
        for seed in mappingList.seeds {
            if let loc = mappingList.MapToLocation(fromSeed: seed) {
                print("Seed/Loc: ", seed, loc)
                sum = min(sum, loc)
            }
        }
        
        part1Message = "Part 1 Result: \(sum)"
    }
    
    func executePart2() {
        let mappingList = Input.getPart2Input()

        Task {
            var sum = Int.max

            for i in 0..<mappingList.seeds.count {
                if i % 10000 == 0 {
                    let percent = Double(round(Double(i) * 100.0 / Double(mappingList.seeds.count)) * 1000) / 1000
                    part2Message = "Part 2 Progress: \(percent)%"
                }
                let seed = mappingList.seeds[i]
                if let loc = mappingList.MapToLocation(fromSeed: seed) {
//                    print("Seed/Loc: ", seed, loc)
                    sum = min(sum, loc)
                }
            }
            part2Message = "Part 2 Result: \(sum)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
