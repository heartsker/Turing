//
//  MatrixUtils.swift
//  Turing
//
//  Created by Daniel Pustotin on 09.05.2022.
//

public extension Matrix {
    /// Applies closure to every element in the matrix
    /// - Parameter completion: Closure to apply
    func forEach(_ completion: (Index) throws -> Void) rethrows {
        for row in rowsRange {
            for column in columnsRange {
                try completion((y: row, x: column))
            }
        }
    }

    /// Transforms every element in the matrix
    /// - Parameter completion: Closure to transform with
    /// - Returns: Transformed matrix
    func map(_ completion: (Index) throws -> T) rethrows -> Matrix {
        var result = self
        for row in rowsRange {
            for column in columnsRange {
                result[row, column] = try completion((y: row, x: column))
            }
        }
        return result
    }
}
