//
//  Collection+only.swift
//  LogicPuzzleTests
//
//  Created by Griff on 11/25/20.
//

import Foundation

public enum OnlyError: Error {
    case noElements
    case moreThanOneElement
}

extension Collection {
    public func only() throws -> Element {
        guard let e = first else {
            throw OnlyError.noElements
        }
        guard count == 1 else {
            throw OnlyError.moreThanOneElement
        }

        return e
    }
}
