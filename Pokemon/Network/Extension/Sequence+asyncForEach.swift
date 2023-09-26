//
//  Sequence+asyncForEach.swift
//  Pokemon
//
//  Created by Fajriharish on 22/09/23.
//

import Foundation

extension Sequence {
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}
