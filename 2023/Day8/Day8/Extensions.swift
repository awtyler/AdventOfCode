//
//  Extensions.swift
//  Day8
//
//  Created by Aaron Tyler on 12/2/24.
//

import Foundation

extension String {
    static func *(_ lhs: String, _ rhs: Int) -> String {
        var str = ""
        for _ in 0..<rhs {
            str += lhs
        }
        return str
    }
    
    func linesToStringArray() -> [String] {
        return split(separator: "\n").map { String($0) }
    }
    
    func tokensToStringArray() -> [String] {
        return split(separator: " ").map { String($0) }
    }
    
    func tokensToIntArray() -> [Int] {
        return split(separator: " ").map { Int(String($0))! }
    }
}


//// concurrentMap from: https://stackoverflow.com/questions/34169469/multithreaded-functional-programming-in-swift
//extension Array {
//    public func concurrentMap<T>(_ transform: (Element) -> T) -> [T] {
//        var results = [Int: T](minimumCapacity: count)
//
//        let lock = NSLock()
//
//        DispatchQueue.concurrentPerform(iterations: count) { index in
//            let result = transform(self[index])
//            lock.synchronized {
//                results[index] = result
//            }
//        }
//
//        return (0 ..< results.count).compactMap { results[$0] }
//    }
//}
//
//// concurrentMap from: https://stackoverflow.com/questions/34169469/multithreaded-functional-programming-in-swift
//extension NSLocking {
//    func synchronized<T>(block: () throws -> T) rethrows -> T {
//        lock()
//        defer { unlock() }
//        return try block()
//    }
//}


//// Found in: https://stackoverflow.com/questions/34169469/multithreaded-functional-programming-in-swift
//extension RandomAccessCollection {
//    /// Returns `self.map(transform)`, computed in parallel.
//    ///
//    /// - Requires: `transform` is safe to call from multiple threads.
//    func concurrentMap<B>(_ transform: (Element) -> B) -> [B] {
//        let batchSize = 4096 // Tune this
//        let n = self.count
//        let batchCount = (n + batchSize - 1) / batchSize
//        if batchCount < 2 { return self.map(transform) }
//
//        return Array(unsafeUninitializedCapacity: n) {
//            uninitializedMemory, resultCount in
//            resultCount = n
//            let baseAddress = uninitializedMemory.baseAddress!
//
//            DispatchQueue.concurrentPerform(iterations: batchCount) { b in
//                let startOffset = b * n / batchCount
//                let endOffset = (b + 1) * n / batchCount
//                var sourceIndex = index(self.startIndex, offsetBy: startOffset)
//                for p in baseAddress+startOffset..<baseAddress+endOffset {
//                    p.initialize(to: transform(self[sourceIndex]))
//                    formIndex(after: &sourceIndex)
//                }
//            }
//        }
//    }
//}
