//
//  Tagging.swift
//  LogicPuzzle
//
//  Created by Griff on 11/25/20.
//

import Foundation

public protocol Tagging {
    func isEqualTo(_ other: Tagging) -> Bool
    func hash(into hasher: inout Hasher)
}

public typealias HashableTag = Tagging & Hashable

extension Tagging where Self: Hashable {
    public func isEqualTo(_ other: Tagging) -> Bool {
        guard let otherTag = other.unerasedTag as? Self else { return false }
        return self == otherTag
    }

    public var erasedTag: AnyTag { (self as? AnyTag) ?? AnyTag(self) }
}

extension Tagging {
    public var unerasedTag: Tagging { (self as? AnyTag)?.box.unboxed() ?? self }
}

extension String: Tagging {}
