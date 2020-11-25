//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public typealias LogicExpression = (World) -> Bool

public class PredicateLogic {
    public typealias LE = LogicExpression

    public static func negate(_ expression: @escaping LE) -> LE {
        { world in !expression(world) }
    }

    public static func conjunction(_ lhs: @escaping LE, _ rhs: @escaping LE) -> LE {
        { world in lhs(world) && rhs(world) }
    }

    public static func agent(_ agentId: Agent.ID, hasPredicate predicate: Predicate) -> LE {
        { world in world.agents[agentId]?.hasPredicate(predicate) ?? false }
    }

    public static func agent(_ agent: Agent, hasPredicate predicate: Predicate) -> LE {
        self.agent(agent.id, hasPredicate: predicate)
    }

    public static func biConditional(_ lhs: @escaping LE, _ rhs: @escaping LE) -> LE {
        { world in lhs(world) == rhs(world) }
    }
}
