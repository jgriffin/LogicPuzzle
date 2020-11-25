@testable import LogicPuzzle
import XCTest

final class WorldsBuilderTests: XCTestCase {
    func testNoAgents() {
        let worlds = WorldsBuilder.worldsWith(agentVariations: [])
        XCTAssert(worlds.isEmpty)
    }

    func testSingleAgentNoVariation() {
        let agent99 = Agent("99")

        let agent99Variations = agent99.variationsFrom([])

        let worlds = WorldsBuilder.worldsWith(agentVariations: [agent99Variations])

        let check: [World] = [
            World(agents: [agent99]),
        ]
        XCTAssertEqual(worlds, check)
    }

    func testSingleAgentOneVariation() {
        let agent99 = Agent("99")
        let tag = "only".erasedTag

        let agent99Variations = agent99.variationsFrom([tag])

        let worlds = WorldsBuilder.worldsWith(agentVariations: [agent99Variations])

        let check: [World] = [
            World(agents: [agent99]),
            World(agents: [agent99.addingTag(tag)]),
        ]

        XCTAssertEqual(worlds, check)
    }

    func testTwoAgents() {
        let agent99 = Agent("99")
        let max = Agent("Max")
        let tag = "only".erasedTag

        let agent99Variations = agent99.variationsFrom([tag])
        let maxVariations = max.variationsFrom([tag])

        let worlds = WorldsBuilder.worldsWith(agentVariations: [
            agent99Variations,
            maxVariations,
        ])

        let check: [World] = [
            World(agents: [agent99, max]),
            World(agents: [agent99.addingTag(tag), max]),
            World(agents: [agent99, max.addingTag(tag)]),
            World(agents: [agent99.addingTag(tag), max.addingTag(tag)]),
        ]

        XCTAssertEqual(worlds, check)
    }
}
