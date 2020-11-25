//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public struct World {
    public let agents: [Agent.ID: Agent]

    public init(_ agents: [Agent]) {
        self.agents = Dictionary(uniqueKeysWithValues: agents.map { ($0.id, $0) })
    }
}

extension World: CustomStringConvertible {
    public var description: String {
        agents.values.map(\.description).joined(separator: "\n")
    }

    public func agentsWith<T: HashableTag>(_ tag: T) -> [Agent] {
        let anyTag = tag.erasedTag
        return agents.values.filter { $0.hasTag(anyTag) }
    }

    public func onlyAgentWith<T: HashableTag>(_ tag: T) throws -> Agent {
        try agentsWith(tag).only()
    }
}

extension World: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        Set(lhs.agents.values) == Set(rhs.agents.values)
    }
}
