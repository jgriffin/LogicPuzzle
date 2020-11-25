//
//  Tagging.swift
//  LogicPuzzle
//
//  Created by Griff on 11/25/20.
//

import Foundation

public struct AnyTag: Tagging, Hashable {
    internal let box: _AnyTagBase

    public init<Concrete: Tagging & Hashable>(_ concrete: Concrete) {
        box = _AnyTagBox(concrete)
    }

    public var description: String { box.description }

    public func hash(into hasher: inout Hasher) { box.hash(into: &hasher) }
    public func isEqualTo(_ other: Tagging) -> Bool { box.isEqualTo(other) }

    public static func == (lhs: AnyTag, rhs: AnyTag) -> Bool {
        lhs.isEqualTo(rhs)
    }
}

internal final class _AnyTagBox<Concrete: Tagging & Hashable>: _AnyTagBase {
    private let concrete: Concrete
    init(_ concrete: Concrete) {
        self.concrete = concrete
    }

    override var description: String { "\(concrete)" }
    override func isEqualTo(_ other: Tagging) -> Bool { concrete.isEqualTo(other) }
    override func hash(into hasher: inout Hasher) { concrete.hash(into: &hasher) }

    override func unboxed() -> Tagging { concrete }
}

internal class _AnyTagBase: Tagging {
    var description: String { fatalError() }
    func isEqualTo(_: Tagging) -> Bool { fatalError() }
    func hash(into _: inout Hasher) { fatalError() }
    func unboxed() -> Tagging { fatalError() }
}
