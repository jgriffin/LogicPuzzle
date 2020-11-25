//
//  AnyTagTests.swift
//  LogicPuzzle
//
//  Created by Griff on 11/25/20.
//

@testable import LogicPuzzle
import XCTest

final class AnyTagTests: XCTestCase {
    struct SimpleTag: Hashable, Tagging, CustomStringConvertible {
        let name: String
        var description: String { name }
    }

    let simple1 = SimpleTag(name: "one")
    let simple2 = SimpleTag(name: "two")
    let string1 = "one"

    func testSimpleTag() {
        XCTAssertEqual(simple1, simple1)
        XCTAssertNotEqual(simple1, simple2)
        XCTAssertEqual(simple1, SimpleTag(name: "one"))
    }

    func testAnySimpleTag() {
        XCTAssertEqual(simple1.erasedTag, simple1.erasedTag)
        XCTAssertNotEqual(simple1.erasedTag, simple2.erasedTag)
        XCTAssertEqual(simple1.erasedTag, SimpleTag(name: "one").erasedTag)
    }

    func testAnyStringTag() {
        XCTAssertEqual(string1.erasedTag, "one".erasedTag)
        XCTAssertNotEqual(string1.erasedTag, "two".erasedTag)
    }

    func testVariedTagging() {
        XCTAssertTrue(string1.isEqualTo("one"))
        XCTAssertTrue(string1.isEqualTo("one".erasedTag))

        XCTAssertFalse(simple1.isEqualTo("two"))
        XCTAssertFalse(simple1.isEqualTo("two".erasedTag))
    }

    func testHashing() {
        let set1 = Set(arrayLiteral: string1.erasedTag)
        XCTAssertTrue(set1.contains(string1.erasedTag))
        XCTAssertTrue(set1.contains("one".erasedTag))
        XCTAssertFalse(set1.contains("two".erasedTag))
    }
}
