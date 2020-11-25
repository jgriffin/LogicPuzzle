//
//  Agent+variations.swift
//  LogicPuzzle
//
//  Created by Griff on 11/24/20.
//

import Foundation

extension Agent {
    public func variationsFrom(_ tags: [AnyTag]) -> [Agent] {
        // combinations of different lengths
        let tagCombinations = (0 ... tags.count)
            .flatMap { count in
                tags.combinations(ofCount: count)
            }

        return tagCombinations.map { tags in
            Agent(self.id, tags)
        }
    }
}
