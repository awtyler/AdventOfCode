//
//  ContentView.swift
//  Day1
//
//  Created by Aaron Tyler on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var part1Message: String = "Ready to Execute..."
    @State var part2Message: String = "Ready to Execute..."
    @State var useSampleData: Bool = true
    @State var executing: Bool = false

    var body: some View {
        VStack {
            Text("Day 1").font(.largeTitle)
            Toggle(isOn: $useSampleData) {
                Text("Use Sample Data")
            }.onChange(of: useSampleData) { oldValue, newValue in
                if newValue {
                    Input.inputType = .sample
                } else {
                    Input.inputType = .real
                }
            }
            

            if executing {
                ProgressView().progressViewStyle(.circular)
            } else {
                ProgressView().progressViewStyle(.circular).hidden()
            }
            Spacer()
            
            Text("Part 1").font(.largeTitle)
            Button(action: {
                execute(.part1)
            }, label: {
                Text("Execute Part 1")
            })
            Text(part1Message)

            Spacer().frame(maxWidth: .infinity, maxHeight: 150)

            Text("Part 2").font(.largeTitle)
            Button(action: {
                execute(.part2)
            }, label: {
                Text("Execute Part 2")
            })
            Text(part2Message)
            
            Spacer()
        }.disabled(executing)
        .padding()
    }

    @MainActor
    func updateText(_ text: String, part: ExecutionPart = Input.executionPart) {
        switch(part) {
        case .part1: part1Message = text
        case .part2: part2Message = text
        }
    }
    
    @MainActor
    func updateExecuting(_ value: Bool) {
        executing = value
    }
    
    func execute(_ part: ExecutionPart) {
        Task {
            Input.executionPart = part
            await updateExecuting(true)
            await updateText("Executing Part \(part == .part1 ? "1" : "2") with \(Input.inputType == .sample ? "sample" : "real") input data...")

            var result = 0

            switch(part) {
            case .part1: result = await executePart1()
            case .part2: result = await executePart2()
            }

            await updateText("Part \(part == .part1 ? "1" : "2") Result: \(result)")
            await updateExecuting(false)
        }

    }
    
    func getDistance(_ num1: Int, _ num2: Int) -> Int {
        if num1 > num2 {
            return num1 - num2
        }
        return num2 - num1
    }
    
    func getSimilarityScores(_ list: [Int]) -> Dictionary<Int, Int> {
        var similarities = Dictionary<Int, Int>()

        for comp in list {
            similarities[comp, default: 0] += comp
        }
        return similarities
    }
    
    func executePart1() async -> Int {
        let pairs = Input.getInput();

        var lefts = pairs.map(\.left)
        var rights = pairs.map(\.right)

        lefts.sort()
        rights.sort()
        
        var sum = 0
        for i in 0..<lefts.count {
            sum += getDistance(lefts[i], rights[i])
        }
        
        return sum
    }
    
    func executePart2() async -> Int {
        let pairs = Input.getInput();

        var lefts = pairs.map(\.left)
        var rights = pairs.map(\.right)
        
        let similarities = getSimilarityScores(rights)
        
        var sum = 0
        for num in lefts {
            sum += similarities[num, default: 0]
        }
        
        return sum
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
