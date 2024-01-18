//
//  ContentView.swift
//  Day2
//
//  Created by Aaron Tyler on 11/3/23.
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
        
        let maxRed = 12
        let maxGreen = 13
        let maxBlue = 14
        
        for game in Input.getInput() {
            sum += game.isValid(maxRed: maxRed, maxGreen: maxGreen, maxBlue: maxBlue) ? game.id : 0
        }
        
        part1Message = "Part 1 Result: \(sum)"
    }
    
    func executePart2() {
        var sum = 0
        
        for game in Input.getInput() {
            sum += game.minPullPower()
        }
        
        part2Message = "Part 2 Result: \(sum)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
