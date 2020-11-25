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

    public func agentsWith(_ tag: AnyTag) -> [Agent] {
        agents.values.filter { $0.hasTag(tag) }
    }

    public func agentsWith<T: Tagging & Hashable>(_ tag: T) -> [Agent] {
        agents.values.filter { $0.hasTag(tag.erasedTag) }
    }

    public func onlyAgentWith(_ tag: AnyTag) throws -> Agent {
        try agentsWith(tag).only()
    }

    public func onlyAgentWith<T: Tagging & Hashable>(_ tag: T) throws -> Agent {
        try onlyAgentWith(tag.erasedTag)
    }
}

extension World: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        Set(lhs.agents.values) == Set(rhs.agents.values)
    }
}
