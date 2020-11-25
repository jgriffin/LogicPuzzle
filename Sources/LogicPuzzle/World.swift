//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public struct World {
    public let agents: [Agent.ID: Agent]

    public init(agents: [Agent]) {
        self.agents = Dictionary(uniqueKeysWithValues: agents.map { ($0.id, $0) })
    }
}

extension World: CustomStringConvertible {
    public var description: String {
        agents.values.map(\.description).joined(separator: "\n")
    }

    public func agentsWith(_ predicate: Predicate.ID) -> [Agent] {
        agents.values.filter { $0.hasPredicate(predicate) }
    }

    public func agentsWith(_ predicate: Predicate) -> [Agent] {
        agentsWith(predicate.id)
    }
}

extension World: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        Set(lhs.agents.values) == Set(rhs.agents.values)
    }
}
