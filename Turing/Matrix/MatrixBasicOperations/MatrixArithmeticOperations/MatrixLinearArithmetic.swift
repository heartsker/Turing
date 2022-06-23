//
//  LinearArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Matrix: ILinearArithmetic {

    // MARK: - Addition
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        assert(lhs.isAcceptableShape(for: .addition, with: rhs), MatrixError.invalidShape.localizedDescription)

        return Matrix(lhs.matrix + rhs.matrix, shape: lhs.shape)
    }

    // MARK: - Subtraction
    public static func - (lhs: Matrix, rhs: Matrix) -> Matrix {
        assert(lhs.isAcceptableShape(for: .subtruction, with: rhs), MatrixError.invalidShape.localizedDescription)

        return Matrix(lhs.matrix - rhs.matrix, shape: lhs.shape)
    }

    // MARK: - Multiplication
    public static func * (lhs: Matrix, rhs: T) -> Matrix {
        Matrix(lhs.matrix.map({ $0 * rhs }), shape: lhs.shape)
    }

    // MARK: - Division
    public static func / (lhs: Matrix, rhs: T) -> Matrix {
        Matrix(lhs.matrix.map({ $0 / rhs }), shape: lhs.shape)
    }

    // MARK: - Negation
    public static prefix func - (matrix: Matrix<T>) -> Matrix<T> {
        matrix * T.negativeOne
    }
}
