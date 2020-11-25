//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

typealias LogicExpression = (World) -> Bool

public class PredicateLogic {
    typealias LE = LogicExpression
    static func negate(_ expression: @escaping LE) -> LE {
        { world in !expression(world) }
    }

    static func conjunction(_ lhs: @escaping LE, _ rhs: @escaping LE) -> LE {
        { world in lhs(world) && rhs(world) }
    }

    static func agent(_ agentId: Agent.ID, hasPredicate predicate: Predicate) -> LE {
        { world in world.agents[agentId]?.hasPredicate(predicate) ?? false }
    }

    static func biConditional(_ lhs: @escaping LE, _ rhs: @escaping LE) -> LE {
        { world in lhs(world) == rhs(world) }
    }
}
