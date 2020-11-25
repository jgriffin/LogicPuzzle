//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public struct Predicate: Identifiable {
    public var id: String

    internal init(_ id: String) {
        self.id = id
    }
}