//
//  WordsBuilderTests.swift
//  LogicPuzzle
//
//  Created by Griff on 11/24/20.
//

import XCTest

final class WorldsBuilderTests: XCTestCase {
    func testNoAgents() {
        let worlds = WorldsBuilder.worldsWith(agentVariations: [])
        XCTAssert(worlds.isEmpty)
    }

    func testSingleAgentNoVariation() {
        let agent99 = Agent("99")

        let agent99Variations = agent99.variationsFrom([Predicate]())

        let worlds = WorldsBuilder.worldsWith(agentVariations: [agent99Variations])

        let check: [World] = [
            World(agents: [agent99]),
        ]
        XCTAssertEqual(worlds, check)
    }

    func testSingleAgentOneVariation() {
        let agent99 = Agent("99")
        let predicate = Predicate("only")

        let agent99Variations = agent99.variationsFrom([predicate])

        let worlds = WorldsBuilder.worldsWith(agentVariations: [agent99Variations])

        let check: [World] = [
            World(agents: [agent99]),
            World(agents: [agent99.with([predicate])]),
        ]

        XCTAssertEqual(worlds, check)
    }

    func testTwoAgents() {
        let agent99 = Agent("99")
        let max = Agent("Max")
        let predicate = Predicate("only")

        let agent99Variations = agent99.variationsFrom([predicate])
        let maxVariations = max.variationsFrom([predicate])

        let worlds = WorldsBuilder.worldsWith(agentVariations: [
            agent99Variations,
            maxVariations,
        ])

        let check: [World] = [
            World(agents: [agent99, max]),
            World(agents: [agent99.with([predicate]), max]),
            World(agents: [agent99, max.with([predicate])]),
            World(agents: [agent99.with([predicate]), max.with([predicate])]),
        ]

        XCTAssertEqual(worlds, check)
    }
}
