//
//  Map.swift
//  Day5
//
//  Created by Aaron Tyler on 1/15/24.
//

enum MapType: Hashable {
    case seed
    case soil
    case fertilizer
    case water
    case light
    case temperature
    case humidity
    case location
}

struct Range {
    let source: Int
    let destination: Int
    let count: Int
    
    init(line: String) {
        let split = line.split(separator: " ").map { Int($0) }
        source = split[1]!
        destination = split[0]!
        count = split[2]!
    }
    
    func inRange(_ value: Int) -> Bool {
        let min = source
        let max = source + count
//        print("*** inRange: ", min, max, value)
        return value <= max && value >= min
    }
    
    func getDestination(_ value: Int) -> Int? {
        guard inRange(value) else { return nil }
//        print("*** destination/source/value: ", destination, source, value, destination + source - value)
        return destination - source + value
    }
}

struct Mapping {
    let ranges: [Range]
    
    func getDestination(_ value: Int?) -> Int? {
        guard let value else { return nil }
        for range in ranges {
            if let dest = range.getDestination(value) {
                return dest
            }
        }
        return value
    }
}

struct MapSetType: Hashable {
    let from: MapType
    let to: MapType
}

struct MappingList {
    var seeds: [Int]
    let mappings: Dictionary<MapSetType, Mapping>
    
    func MapToLocation(fromSeed seed: Int) -> Int? {
        let soilType = mappings[.init(from: .seed, to: .soil)]?.getDestination(seed)
        let fertilizerType = mappings[.init(from: .soil, to: .fertilizer)]?.getDestination(soilType)
        let waterType = mappings[.init(from: .fertilizer, to: .water)]?.getDestination(fertilizerType)
        let lightType = mappings[.init(from: .water, to: .light)]?.getDestination(waterType)
        let tempType = mappings[.init(from: .light, to: .temperature)]?.getDestination(lightType)
        let humidType = mappings[.init(from: .temperature, to: .humidity)]?.getDestination(tempType)
        let locType = mappings[.init(from: .humidity, to: .location)]?.getDestination(humidType)

//        print("* Seed: ", seed)
//        print("* Soil: ", soilType)
//        print("* Fert: ", fertilizerType)
//        print("* Watr: ", waterType)
//        print("* Lght: ", lightType)
//        print("* Temp: ", tempType)
//        print("* Humi: ", humidType)
//        print("* Loc : ", locType)

        return locType
    }
}
