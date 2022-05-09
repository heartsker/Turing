//
//  Validation.swift
//  Turing
//
//  Created by Daniel Pustotin on 09.05.2022.
//

internal extension Matrix {
    func isValid(_ slice: Slice, index: FlatIndex) -> Bool {
        switch slice {
        case .row:
            return 0 <= index && index < dimY

        case .column:
            return 0 <= index && index < dimX
        }
    }
}
