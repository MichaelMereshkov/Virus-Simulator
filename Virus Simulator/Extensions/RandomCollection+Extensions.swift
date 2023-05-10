//
//  RandomCollection+Extensions.swift
//  Virus Simulator
//
//  Created by Михаил Мерешковв on 09.05.2023.
//

import Foundation

public extension RandomAccessCollection {

    // MARK: - Functions

    func element(at index: Index) -> Element? {
        guard indices.contains(index) else {
            return nil
        }

        return self[index]
    }
}
