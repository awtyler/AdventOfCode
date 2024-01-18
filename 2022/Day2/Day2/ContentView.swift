//
//  ContentView.swift
//  Day2
//
//  Created by Aaron Tyler on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var part1Message: String = ""
    @State var part2Message: String = ""

    var body: some View {
        VStack {
            Text("Part 1").font(.largeTitle)
            Button(action: {
                executePart1()
            }, label: {
                Text("Execute Part 1")
            })
            Text(part1Message)


            Text("Part 2").font(.largeTitle)
            Button(action: {
                executePart2()
            }, label: {
                Text("Execute Part 2")
            })
            Text(part2Message)
        }
        .padding()
    }
    
    func executePart1() {
        let rounds = Input.getPart1Rounds()
        var sum = 0
        for round in rounds {
            sum += round.getScore()
        }
        part1Message = "Total Points: \(sum)"
    }
    
    func executePart2() {
        let rounds = Input.getPart2Rounds()
        var sum = 0
        for round in rounds {
            sum += round.getScore()
        }
        part2Message = "Total Points: \(sum)"
    }
}

#Preview {
    ContentView()
}
