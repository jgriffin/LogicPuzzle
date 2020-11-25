//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public struct Agent: Identifiable, Hashable, CustomStringConvertible {
    public typealias ID = String

    public let id: ID
    public let tags: Set<AnyTag>

    public init<S: Sequence>(_ id: ID,
                             _ tags: S) where S.Element == AnyTag
    {
        self.id = id
        self.tags = Set(tags)
    }

    public init(_ id: ID) {
        self.init(id, [])
    }

    public var description: String {
        "agent: \(id) tags: \(tags.map { "\($0)" }.sorted().joined(separator: ","))"
    }
}

extension Agent {
    public func hasTag<T: Tagging>(_ tag: T) -> Bool where T: Hashable {
        tags.contains(tag.erasedTag)
    }

    // MARK: tags of type

    public func tagsOfType<T: Tagging>(_: T.Type = T.self) -> [T] {
        tags.compactMap { $0.unerasedTag as? T }
    }

    public func onlyTagOfType<T: Tagging>(_: T.Type = T.self) throws -> T {
        try tagsOfType(T.self).only()
    }

    // MARK: where

    public func tagsWhere(_ filter: (AnyTag) -> Bool) -> [AnyTag] {
        tags.filter(filter)
    }

    public func tagsOfTypeWhere<T: Tagging>(_: T.Type = T.self,
                                            _ filter: (T) -> Bool) -> [T]
    {
        tagsOfType(T.self).filter(filter)
    }

    // MARK: changing tags

    public func settingTags<S: Sequence>(_ tags: S) -> Agent where S.Element == AnyTag {
        .init(id, tags)
    }

    public func addingTags<S: Sequence>(_ tags: S) -> Agent where S.Element == AnyTag {
        .init(id, self.tags.union(tags))
    }

    public func addingTag(_ tag: AnyTag) -> Agent {
        addingTags([tag])
    }
}
