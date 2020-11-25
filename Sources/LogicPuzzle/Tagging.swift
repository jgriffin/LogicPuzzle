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
    func unboxed() -> Tagging
}

extension Tagging {
    public func isEqualTo(_ other: Tagging) -> Bool where Self: Equatable {
        guard let otherTag = other.unboxed() as? Self else { return false }
        return self == otherTag
    }
    
    public func erased() -> AnyTag where Self: Hashable { (self as? AnyTag) ?? AnyTag(self) }
    public func unboxed() -> Tagging { self }
}

extension String: Tagging {}
