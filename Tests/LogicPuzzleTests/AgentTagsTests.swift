@testable import LogicPuzzle
import XCTest

final class AgentTagsTests: XCTestCase {
    enum Name: Hashable, Tagging {
        case nineNine, max
    }

    let agent99 = Agent("99", [Name.nineNine.erasedTag, "secret".erasedTag])

    func testHasTag() {
        XCTAssertTrue(agent99.hasTag(Name.nineNine))
        XCTAssertTrue(agent99.hasTag("secret"))
        XCTAssertFalse(agent99.hasTag(Name.max))
    }

    func testTagsofType() {
        XCTAssertEqual(agent99.tagsOfType(Name.self).count, 1)
        XCTAssertEqual(try! agent99.onlyTagOfType(Name.self), .nineNine)

        XCTAssertEqual(agent99.tagsOfType(String.self).count, 1)
        XCTAssertEqual(try! agent99.onlyTagOfType(String.self), "secret")
    }
}
