//
//  TypeCheck.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

public extension Matrix {

    /// Defines if the matrix has square shape
    /// - Note:
    /// Example of square matrix:
    /// | 1 2 3 |
    /// | 4 5 6 |
    /// | 7 8 9 |
    var isSquare: Bool {
        dimY == dimX
    }

    /// Defines if the matrix is zero
    /// - Note:
    /// Example of square matrix:
    /// | 0 0 0 0 |
    /// | 0 0 0 0 |
    var isZero: Bool {
        !matrix.contains {
            $0 != T.zero
        }
    }

    /// Defines if the matrix is diagonal
    /// - Note:
    /// Example of square matrix:
    /// | 1 0 0 |
    /// | 0 5 0 |
    /// | 0 0 9 |
    var isDiagonal: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != .zero && !isDiagonal(index: index)
        }
    }

    /// Defines if the matrix is lower triangular
    /// - Note:
    /// Example of square matrix:
    /// | 1 0 0 |
    /// | 4 5 0 |
    /// | 7 8 9 |
    var isLowerTriangular: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != .zero && expanded(index: index).y < expanded(index: index).x
        }
    }

    /// Defines if the matrix is upper triangular
    /// - Note:
    /// Example of square matrix:
    /// | 1 2 3 |
    /// | 0 5 6 |
    /// | 0 0 9 |
    var isUpperTriangular: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != .zero && expanded(index: index).y > expanded(index: index).x
        }
    }

    /// Defines if the matrix is lower triangular or upper triangular
    var isTriangular: Bool {
        isLowerTriangular || isUpperTriangular
    }

    /// Defines if the matrix is symmetric
    /// - Note:
    /// Example of square matrix:
    /// | 1 2 3 |
    /// | 2 5 6 |
    /// | 3 6 9 |
    var isSymmetric: Bool {
        isSquare && self == transposed()
    }

    /// Defines if the matrix is skew-symmetric
    /// - Note:
    /// Example of square matrix:
    /// |  0  2 3 |
    /// | -2  0 6 |
    /// | -3 -6 0 |
    var isSkewSymmetric: Bool {
        isSquare && self == -transposed()
    }

    /// Defines if the matrix is identical
    /// - Note:
    /// Example of square matrix:
    /// | 1 0 0 |
    /// | 0 1 0 |
    /// | 0 0 1 |
    var isIdentical: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != (isDiagonal(index: index) ? .one : .zero)
        }
    }

}
