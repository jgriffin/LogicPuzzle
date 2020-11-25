//
//  AgentVariationsTests.swift
//  LogicPuzzle
//
//  Created by Griff on 11/24/20.
//

import LogicPuzzle
import XCTest

final class AgentVariationsTests: XCTestCase {
    func testNoVariation() {
        let agent = Agent("test")

        let variations = agent.variationsFrom([])

        XCTAssertEqual(variations, [agent])
    }

    func testVariationsSingle() {
        let agent = Agent("test")
        let tag = "onlyPredicate".erasedTag

        let variations = agent.variationsFrom([tag])

        let check: [Agent] = [
            agent.settingTags([]),
            agent.settingTags([tag]),
        ]

        XCTAssertEqual(variations, check)
    }

    func testVariationsDouble() {
        let agent = Agent("test")
        let tag1 = "tag1".erasedTag
        let tag2 = "tag2".erasedTag

        let variations = agent.variationsFrom([tag1, tag2])

        let check: [Agent] = [
            agent.settingTags([]),
            agent.settingTags([tag1]),
            agent.settingTags([tag2]),
            agent.settingTags([tag1, tag2]),
        ]

        XCTAssertEqual(variations, check)
    }
}
