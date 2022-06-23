//
//  SliceAddition.swift
//  Turing
//
//  Created by Daniel Pustotin on 09.05.2022.
//

public extension Matrix {
    /// Add elements of one slice to the corresponding elements of another
    /// - Parameters:
    ///   - slice: `row` or `column`
    ///   - from: Slice index to add values from
    ///   - to: Slice index to add values to
    mutating func add(_ slice: Slice, index from: FlatIndex, to: FlatIndex) {
        assert(isValid(slice, index: from) && isValid(slice, index: to),
               MatrixError.indexOutOfRange.localizedDescription)
        switch slice {
        case .row:
            for y in columnsRange {
                self[from, y] += self[to, y]
            }

        case .column:
            for y in rowsRange {
                self[y, from] += self[y, to]
            }
        }
    }
}
