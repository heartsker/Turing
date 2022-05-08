//
//  AdditiveArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Matrix: AdditiveArithmetic {
    public static var zero: Matrix<T> {
        zero(0)
    }

    // MARK: - Addition
    public func add(_ other: Matrix) -> Matrix {
        assert(isAcceptableShape(for: .addition, with: other),
               MatrixError.wrongShape.localizedDescription)

        return Matrix(flat: matrix ++ other.matrix, shape: shape)
    }

    public static func add(_ lhs: Matrix, to rhs: Matrix) -> Matrix {
        lhs.add(rhs)
    }

    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        lhs.add(rhs)
    }

    // MARK: - Subtraction

    public func subtract(_ other: Matrix) -> Matrix {
        assert(isAcceptableShape(for: .addition, with: other),
               MatrixError.wrongShape.localizedDescription)

        return Matrix(flat: matrix ++ other.matrix, shape: shape)
    }

    public static func subtract(_ lhs: Matrix, _ rhs: Matrix) -> Matrix {
        lhs.subtract(rhs)
    }

    public static func - (lhs: Matrix, rhs: Matrix) -> Matrix {
        lhs.subtract(rhs)
    }
}
