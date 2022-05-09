//
//  SliceMultiplication.swift
//  Turing
//
//  Created by Daniel Pustotin on 09.05.2022.
//

public extension Matrix {
    /// Multiplies all elements in the slice by scalar value
    /// - Parameters:
    ///   - slice: `row` or `column`
    ///   - index: Index of `row` or `column`
    ///   - value: Scalar value to multiply by
    mutating func multiply(_ slice: Slice, index: FlatIndex, by value: T) {
        assert(isValid(slice, index: index), MatrixError.indexOutOfRange.localizedDescription)
        switch slice {
        case .row:
            for y in columnsRange {
                self[index, y] *= value
            }

        case .column:
            for y in rowsRange {
                self[y, index] *= value
            }
        }
    }
}
