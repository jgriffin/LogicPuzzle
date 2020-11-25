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

    public static func agent(_ agentId: Agent.ID, hasTag tag: AnyTag) -> LE {
        { world in world.agents[agentId]?.hasTag(tag) ?? false }
    }

    public static func agent(_ agent: Agent, hasTag tag: AnyTag) -> LE {
        self.agent(agent.id, hasTag: tag)
    }

    public static func biConditional(_ lhs: @escaping LE, _ rhs: @escaping LE) -> LE {
        { world in lhs(world) == rhs(world) }
    }
}
