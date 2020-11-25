//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public struct Agent: Identifiable, Hashable, CustomStringConvertible {
    public typealias ID = String

    public let id: ID
    public let predicates: Set<Predicate.ID>

    public init(_ id: ID,
                _ predicates: [Predicate.ID] = [])
    {
        self.id = id
        self.predicates = Set(predicates)
    }

    public func hasPredicate(_ predicateId: Predicate.ID) -> Bool {
        predicates.contains(predicateId)
    }

    public func with(_ predicates: [Predicate.ID]) -> Agent {
        Agent(id, predicates)
    }

    public var description: String {
        "agent: \(id) predicates: \(predicates.sorted().joined(separator: ","))"
    }

    public static func == (lhs: Agent, rhs: Agent) -> Bool {
        lhs.id == rhs.id &&
            lhs.predicates == rhs.predicates
    }
}

extension Agent {
    // MARK: Full Predicate conveniences

    public init(_ id: ID,
                _ predicates: [Predicate])
    {
        self.init(id, predicates.map(\.id))
    }

    public func hasPredicate(_ predicate: Predicate) -> Bool {
        predicates.contains(predicate.id)
    }

    public func with(_ predicates: [Predicate]) -> Agent {
        Agent(id, predicates.map(\.id))
    }
}
