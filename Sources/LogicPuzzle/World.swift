//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public struct World: Equatable {
    public let agents: [Agent.ID: Agent]

    public init(agents: [Agent]) {
        self.agents = Dictionary(uniqueKeysWithValues: agents.map { ($0.id, $0) })
    }
}

extension World: CustomStringConvertible {
    public var description: String {
        agents.values.map(\.description).joined(separator: "\n")
    }
}
