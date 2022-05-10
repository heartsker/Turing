//
//  SliceSwitching.swift
//  Turing
//
//  Created by Daniel Pustotin on 09.05.2022.
//

public extension Matrix {
    /// Interchanges all the elements of two slices
    /// - Parameters:
    ///   - slice: `row` or `column`
    ///   - first: First slice index
    ///   - second: Second slice index
    mutating func `switch`(_ slice: Slice, _ first: FlatIndex, with second: FlatIndex) {
        assert(isValid(slice, index: first) && isValid(slice, index: second),
               MatrixError.indexOutOfRange.localizedDescription)

        let tmp = self[slice, first]
        self[slice, first] = self[slice, second]
        self[slice, second] = tmp
    }
}
