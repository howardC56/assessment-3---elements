//
//  Element.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/14/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit


struct Element: Codable {
    let name: String
    let atomicMass: Double
    let symbol: String
    let number: Int
    let melt: Double?
    let boil: Double?
    let discovered: String?
    
     private enum CodingKeys: String, CodingKey {
        case name, symbol, number, melt, boil
        case atomicMass = "atomic_mass"
        case discovered = "discovered_by"
    }

}
