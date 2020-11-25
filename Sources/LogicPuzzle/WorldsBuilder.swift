//
//  WorldsBuilder.swift
//
//
//  Created by Griff on 11/24/20.
//

import Algorithms
import Foundation

public struct WorldsBuilder {
    public static func worldsWith(agentVariations: [[Agent]]) -> [World] {
        agentWorldsWith(agentVariations[...],
                        onto: [])
            .map { World($0) }
    }

    typealias AgentVariations = ArraySlice<[Agent]>
    typealias WorldAgents = [Agent]
    typealias AgentWorlds = [WorldAgents]

    static func agentWorldsWith(_ agentVariations: AgentVariations,
                                onto agentWorlds: AgentWorlds) -> AgentWorlds
    {
        guard let nextAgents = agentVariations.first else { return agentWorlds }
        let remainingAgentVariations = agentVariations.dropFirst()

        let worldsWithNextAgent = nextAgents.flatMap { nextAgent -> AgentWorlds in
            guard !agentWorlds.isEmpty else { return [[nextAgent]] }
            return agentWorlds.map { $0 + [nextAgent] }
        }

        return agentWorldsWith(remainingAgentVariations,
                               onto: worldsWithNextAgent)
    }
}
