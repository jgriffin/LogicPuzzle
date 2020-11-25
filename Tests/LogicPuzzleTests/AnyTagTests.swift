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
        XCTAssertEqual(simple1.erased(), simple1.erased())
        XCTAssertNotEqual(simple1.erased(), simple2.erased())
        XCTAssertEqual(simple1.erased(), SimpleTag(name: "one").erased())
    }

    func testAnyStringTag() {
        XCTAssertEqual(string1.erased(), "one".erased())
        XCTAssertNotEqual(string1.erased(), "two".erased())
    }
    
    func testHashing() {
        let set1 = Set(arrayLiteral: string1.erased())
        XCTAssertTrue(set1.contains(string1.erased()))
        XCTAssertTrue(set1.contains("one".erased()))
        XCTAssertFalse(set1.contains("two".erased()))
    }
}
