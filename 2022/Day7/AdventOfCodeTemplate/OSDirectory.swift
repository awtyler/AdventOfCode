//
//  Directory.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/6/23.
//

import Foundation

class OSDirectory: Hashable {
    let name: String
    private var subdirectories: [OSDirectory] = []
    private var files: [OSFile] = []
    let parentDirectory: OSDirectory?
    
    init(name: String, parentDirectory: OSDirectory?) {
        self.name = name
        self.parentDirectory = parentDirectory
    }
    
    func getSubdirectory(named: String) -> OSDirectory? {
        return subdirectories.first { $0.name == named }
    }
    
    func addSubdirectory(_ dir: OSDirectory) {
//        print("Adding Directory (\(dir.name)) to (\(name))")
        self.subdirectories.append(dir)
    }
    
    func getFile(named: String) -> OSFile? {
        return files.first { $0.name == named }
    }
    
    func addFile(_ file: OSFile) {
//        print("Adding file: (\(file.name)) to (\(name))")
        self.files.append(file)
    }
    
    func getDirectories(withMaxSize size: Int) -> [OSDirectory] {
        var directories: Set<OSDirectory> = []

        for dir in subdirectories {
            let dirSize = dir.getTotalSize()
//            print("Checking (\(dir.name)) with size (\(dirSize))")
            if dirSize <= size {
//                print("*** Adding (\(dir.name)) with size (\(dirSize))")
                directories.insert(dir)
            }
            dir.getDirectories(withMaxSize: size).forEach {
                directories.insert($0)
            }
        }
        return Array(directories)
    }
    
    func getTotalSize() -> Int {
        var sum = 0
        self.files.forEach { sum += $0.size }
        self.subdirectories.forEach {
            sum += $0.getTotalSize()
        }
        return sum
    }
    
    func getFQN() -> String {
        if let parentDirectory {
            return "\(parentDirectory.getFQN())/\(name)"
        } else {
            return name
        }
    }
    
    static func == (lhs: OSDirectory, rhs: OSDirectory) -> Bool {
        return lhs.getFQN() == rhs.getFQN()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(getFQN())
    }
}
