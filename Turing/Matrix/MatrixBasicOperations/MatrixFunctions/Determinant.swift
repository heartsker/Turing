//
//  Determinant.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

public extension Matrix {
    /// Determinant of the matrix
    var determinant: T {
        mutating get {
            assert(type(is: .square), MatrixError.incorrectType(expected: .square).localizedDescription)

            var matrix = self
            let dim = dimY
            var multiplier = T.one

            for y in 0 ..< dim - 1 where matrix[y, y] != T.zero {
                for x in y ..< dim - 1 {
                    let factor = matrix[x + 1, y] / matrix[y, y]
                    multiplier *= factor

                    matrix[.row, x + 1] -= matrix[.row, y] * factor
                }
            }

            return matrix.mainDiagonal.product / multiplier
        }
    }
}
