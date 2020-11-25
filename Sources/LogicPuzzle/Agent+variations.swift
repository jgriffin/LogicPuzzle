//
//  Agent+variations.swift
//  LogicPuzzle
//
//  Created by Griff on 11/24/20.
//

import Foundation

extension Agent {
    func variationsFrom(_ predicates: [Predicate.ID]) -> [Agent] {
        let predicateCombinations = (0 ... predicates.count)
            .flatMap { count in
                predicates.combinations(ofCount: count)
            }

        return predicateCombinations.map { predicates in
            Agent(self.id, predicates)
        }
    }

    func variationsFrom(_ predicates: [Predicate]) -> [Agent] {
        variationsFrom(predicates.map(\.id))
    }
}
