//
//  AgentVariationsTests.swift
//  LogicPuzzle
//
//  Created by Griff on 11/24/20.
//

import XCTest
import LogicPuzzle

final class AgentVariationsTests: XCTestCase {
    func testNoVariation() {
        let agent = Agent("test")

        let variations = agent.variationsFrom([Predicate]())

        XCTAssertEqual(variations, [agent])
    }

    func testVariationsSingle() {
        let agent = Agent("test")
        let predicate = Predicate("onlyPredicate")

        let variations = agent.variationsFrom([predicate])

        let check: [Agent] = [
            agent.with([Predicate]()),
            agent.with([predicate]),
        ]

        XCTAssertEqual(variations, check)
    }

    func testVariationsDouble() {
        let agent = Agent("test")
        let predicate1 = Predicate("predicate1")
        let predicate2 = Predicate("predicate2")

        let variations = agent.variationsFrom([predicate1, predicate2])

        let check: [Agent] = [
            agent.with([Predicate]()),
            agent.with([predicate1]),
            agent.with([predicate2]),
            agent.with([predicate1, predicate2]),
        ]

        XCTAssertEqual(variations, check)
    }
}
