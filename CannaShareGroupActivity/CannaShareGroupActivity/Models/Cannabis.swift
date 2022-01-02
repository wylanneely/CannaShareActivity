//
//  Cannabis.swift
//  CannaShareGroupActivity
//
//  Created by Wylan L Neely on 1/1/22.
//

import Foundation

struct Cannabis: Hashable, Codable {
    var name: String
    var type: String
    var description: String
    
    init(name: String, type: CannabisType, description: String) {
        self.name = name
        self.type = type.rawValue
        self.description = description
    }
}

enum CannabisType: String {
    case Indica
    case Sativa
    case Hybrid
}
