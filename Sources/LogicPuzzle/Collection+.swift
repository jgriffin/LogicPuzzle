//
//  File.swift
//
//
//  Created by Griff on 11/24/20.
//

import Foundation

public enum OnlyError: Error {
    case onlyElementCheckFailed
}

extension Collection {
    public func only() throws -> Element {
        guard count == 1,
            let e = first
        else {
            throw OnlyError.onlyElementCheckFailed
        }

        return e
    }
}
