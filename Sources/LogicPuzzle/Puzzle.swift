//
//  File.swift
//  
//
//  Created by Griff on 11/24/20.
//

import Foundation

public struct Puzzle {
    public var count: Int { worlds.count }
    
    public private(set) var worlds: [World]
    
    public init(_ worlds: [World]) {
        self.worlds = worlds
    }
    
    public mutating func applyFilter(_ filter: LogicExpression) {
        worlds = worlds.filter(filter)
    }
}
