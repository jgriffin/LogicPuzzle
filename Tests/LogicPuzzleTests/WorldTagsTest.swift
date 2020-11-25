@testable import LogicPuzzle
import XCTest

final class WorldTagsTests: XCTestCase {
    enum Name: Hashable, Tagging {
        case nineNine, max
    }

    let agent99 = Agent("99", [Name.nineNine.erasedTag, "secret".erasedTag])
    let max = Agent("max", [Name.max.erasedTag, "secret".erasedTag])
    let other = Agent("other", ["secret".erasedTag])

    func testAgentsWithTag() {
        let world = World(agents: [agent99, max, other])

        XCTAssertEqual(world.agentsWith("secret").count, 3)
        XCTAssertEqual(try! world.onlyAgentWith(Name.nineNine), agent99)
    }
}
