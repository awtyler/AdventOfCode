//
//  ContentView.swift
//  Day13
//
//  Created by Aaron Tyler on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var part1Message: String = "Ready to Execute..."
    @State var part2Message: String = "Ready to Execute..."
    @State var executionTimeMessage: String = ""
    @State var useSampleData: Bool = true
    @State var executing: Bool = false

    var body: some View {
        VStack {
            Text("Day 5").font(.largeTitle)
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
                Task {
                    await execute(.part1)
                }
            }, label: {
                Text("Execute Part 1")
            })
            Text(part1Message)

            Spacer().frame(maxWidth: .infinity, maxHeight: 150)

            Text("Part 2").font(.largeTitle)
            Button(action: {
                Task {
                    await execute(.part2)
                }
            }, label: {
                Text("Execute Part 2")
            })
            Text(part2Message)
            
            Spacer()
            Text(executionTimeMessage)
        }.disabled(executing)
        .padding()
    }

    func updateText(_ text: String, part: ExecutionPart = Input.executionPart) {
        Task { @MainActor in
            switch(part) {
            case .part1: part1Message = text
            case .part2: part2Message = text
            }
        }
    }
    
    func updateExecuting(_ value: Bool) {
        Task { @MainActor in
            executing = value
        }
    }
    
    func toTimeDisplay(seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        print("HMS: \(hours) \(minutes) \(seconds)")
        return String(format: "%02d:%02d:%02d", arguments: [hours, minutes, seconds])
    }
    
    nonisolated func execute(_ part: ExecutionPart) async {
        print("STARTING...")
        let startTime = Date.now

        Task { @MainActor in
            executionTimeMessage = ""
        }
        
        Input.executionPart = part
        await updateExecuting(true)
        await updateText("Executing Part \(part == .part1 ? "1" : "2") with \(Input.inputType == .sample ? "sample" : "real") input data...")

        Task.detached(priority: .background) {

            var result = 0

            print("BEFORE 1")
            switch(part) {
            case .part1: result = await executePart1()
            case .part2: result = await executePart2()
            }
            print("AFTER 1")
            let endTime = Date.now
            let diff = Int(endTime.timeIntervalSince1970 - startTime.timeIntervalSince1970)

            await updateText("Result: \(result)")
            await updateExecuting(false)
            
            Task { @MainActor in
                executionTimeMessage = "Execution time: \(toTimeDisplay(seconds: diff))"
            }
        }
    }
    
    func executePart1() async -> Int {
        var answer = 0
        
        let machines = Input.getClawMachines()
        machines.forEach { $0.setOptions() }
        
        for m in machines {
            answer += m.getCheapestOption()?.cost ?? 0
        }
        
        return answer
    }
    
    func executePart2() async -> Int {
        var answer = 0
        
        let machines = Input.getClawMachines()
        machines.forEach {
            $0.adjustForPart(part: .part2)
            $0.setOptions()
        }
        
        for m in machines {
            answer += m.getCheapestOption()?.cost ?? 0
        }
        
        return answer
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
