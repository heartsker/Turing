//
//  Transposition.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

public extension Matrix {
    /// Transposition is combining rotating and mirroring the matrix
    /// - Note:
    /// Initial matrix:
    /// | 1   2   3   4 |
    /// | 5   6   7   8 |
    /// | 8 10 11 12 |
    /// Transposed matrix:
    /// | 1 5   8 |
    /// | 2 6 10 |
    /// | 3 7 11 |
    /// | 4 8 12 |
    /// - Returns: Transposed matrix
    func transposed() -> Matrix {
        var result = Matrix.zero((y: dimX, x: dimY))
        for y in rowsRange {
            for x in columnsRange {
                result[x, y] = self[y, x]
            }
        }
        return result
    }

    /// Transposes the matrix
    mutating func transpose() {
        self = transposed()
    }

    /// Transposes the matrix
    /// - Parameter matrix: Matrix to transpose
    static func transpose(_ matrix: inout Matrix) {
        matrix.transpose()
    }
}
