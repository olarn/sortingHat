//
//  Hogwarts.swift
//  SortingHat
//
//  Created by Olarn U. on 27/4/2565 BE.
//

import Foundation

enum House: String {
    case griffendor = "Griffendor"
    case slitherine = "Slitherine"
    case ravenclaw = "Ravenclaw"
    case hufflepuff = "Hufflepuff"
}

class Hogwarts {
    static var maxStudentInEachHouse = 13
    
    static var houses: [House: Int] = [
        .griffendor: 0,
        .slitherine: 0,
        .ravenclaw: 0,
        .hufflepuff: 0,
    ]
    
    static func sortFor(_ name: String) -> String {
        let house = sortingHouse
        houses[house]! += 1
        return house.rawValue
    }
    
    private static var sortingHouse: House {
        var allHouses = houses
        var houseStillRemains = true

        repeat {
            //TODO: Need to change the better house selection.
            if let house = allHouses.randomElement()?.key {
                if allHouses[house]! < maxStudentInEachHouse {
                    return house
                } else {
                    allHouses.removeValue(forKey: house)
                }
            } else {
                houseStillRemains = false
            }
        } while houseStillRemains && allHouses.count > 0
        
        // House of Hufflepuff welcome everyone.
        //   So, if the everage number of students in other houses reach to maximum.
        //   they are all welcome in hufflepuff.
        return .hufflepuff
    }
}
