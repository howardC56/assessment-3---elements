//
//  Element.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/14/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit


struct Element: Codable, Hashable {
//    let name: String
//    let atomicMass: Double
//    let symbol: String
//    let number: Int
//    let melt: Double?
//    let boil: Double?
//    let discovered: String?
//
//     private enum CodingKeys: String, CodingKey {
//        case name, symbol, number, melt, boil
//        case atomicMass = "atomic_mass"
//        case discovered = "discovered_by"
//    }
    let category: String
    let melt, boil: Double?
    let period: Int
    let symbol: String
    let discoveredBy: String?
    let molarHeat: Double?
    let phase: String
    let source: String
    let summary: String
    let favoritedBy: String?
    let number: Int
    let appearance: String?
    let density: Double?
    let atomicMass: Double
    let name: String

    private enum CodingKeys: String, CodingKey {
        case category, melt, boil, period, symbol
        case discoveredBy = "discovered_by"
        case molarHeat = "molar_heat"
        case phase, source, summary, favoritedBy, number, appearance, density
        case atomicMass = "atomic_mass"
        case name
    }

}
