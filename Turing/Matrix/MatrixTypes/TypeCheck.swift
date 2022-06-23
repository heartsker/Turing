//
//  TypeCheck.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

public extension Matrix {

    /// Defines if the matrix is empty
    private var isEmpty: Bool {
        shape == (y: 0, x: 0)
    }

    /// Defines if the matrix is zero
    /// - Note:
    /// Example of square matrix:
    /// | 0 0 0 0 |
    /// | 0 0 0 0 |
    private var isZero: Bool {
        !matrix.contains {
            $0 != T.zero
        }
    }

    /// Defines if the matrix has square shape
    /// - Note:
    /// Example of square matrix:
    /// | 1 2 3 |
    /// | 4 5 6 |
    /// | 7 8 9 |
    private var isSquare: Bool {
        dimY == dimX
    }

    /// Defines if the matrix is diagonal
    /// - Note:
    /// Example of square matrix:
    /// | 1 0 0 |
    /// | 0 5 0 |
    /// | 0 0 9 |
    private var isDiagonal: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != .zero && !isOnDiagonal(index)
        }
    }

    /// Defines if the matrix is lower triangular
    /// - Note:
    /// Example of square matrix:
    /// | 1 0 0 |
    /// | 4 5 0 |
    /// | 7 8 9 |
    private var isLowerTriangular: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != .zero && expanded(index).y < expanded(index).x
        }
    }

    /// Defines if the matrix is upper triangular
    /// - Note:
    /// Example of square matrix:
    /// | 1 2 3 |
    /// | 0 5 6 |
    /// | 0 0 9 |
    private var isUpperTriangular: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != .zero && expanded(index).y > expanded(index).x
        }
    }

    /// Defines if the matrix is lower triangular or upper triangular
    private var isTriangular: Bool {
        isLowerTriangular || isUpperTriangular
    }

    /// Defines if the matrix is symmetric
    /// - Note:
    /// Example of square matrix:
    /// | 1 2 3 |
    /// | 2 5 6 |
    /// | 3 6 9 |
    private var isSymmetric: Bool {
        isSquare && self == transposed()
    }

    /// Defines if the matrix is skew-symmetric
    /// - Note:
    /// Example of square matrix:
    /// |  0  2 3 |
    /// | -2  0 6 |
    /// | -3 -6 0 |
    private var isSkewSymmetric: Bool {
        isSquare && self == -transposed()
    }

    /// Defines if the matrix is identical
    /// - Note:
    /// Example of square matrix:
    /// | 1 0 0 |
    /// | 0 1 0 |
    /// | 0 0 1 |
    private var isIdentical: Bool {
        isSquare && !matrix.indices.contains { index in
            matrix[index] != (isOnDiagonal(index) ? .one : .zero)
        }
    }

    /// Defines if the matrix is invertible
    /// - Note:
    /// Matrix `A` is invertible if there exists such matrix `B` that
    /// `A * B` == `B * A` == `I`
    /// where `I` is identical matrix
    private var isInvertible: Bool {
        mutating get {
            isSquare && determinant != T.zero
        }
    }

    /// Defines if the matrix is of some type
    /// - Parameter type: Type to check
    /// - Returns: `true` if type of matrix is `type`, otherwise `false`
    mutating func type(is type: MatrixType) -> Bool {
        #if TIME_OPTIMIZED
        if !(isUpdateNeeded[type] ?? true), let saved = savedTypes[type] {
            return saved
        }
        #endif
        let result: Bool
        switch type {
        case .empty:
            result = isEmpty

        case .zero:
            result = isZero

        case .square:
            result = isSquare

        case .diagonal:
            result = isDiagonal

        case .lowerTriangular:
            result = isLowerTriangular

        case .upperTriangular:
            result = isUpperTriangular

        case .symmetric:
            result = isSymmetric

        case .skewSymmetric:
            result = isSkewSymmetric

        case .identical:
            result = isIdentical

        case .invertible:
            result = isInvertible
        }
        #if TIME_OPTIMIZED
        savedTypes[type] = result
        isUpdateNeeded[type] = false
        #endif
        return result
    }

    /// Difines a collection of all types of the matrix
    var types: [MatrixType] {
        mutating get {
            var types: [MatrixType] = []

            MatrixType.allCases.forEach {
                if type(is: $0) {
                    types.append($0)
                }
            }
            return types
        }
    }
}
