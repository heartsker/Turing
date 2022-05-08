//
//  TypeCheck.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

public extension Matrix {

    /// Defines if the matrix has square shape
    var isSquare: Bool {
        dimY == dimX
    }

    /// Defines if the matrix is zero
    var isZero: Bool {
        !matrix.contains {
            $0 != T.zero
        }
    }

    /// Defines if the matrix is identical
    var isIdentical: Bool {
        !matrix.indices.contains { index in
            matrix[index] != (isDiagonal(index: index) ? T.one : T.zero)
        }
    }
}
