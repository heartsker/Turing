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

    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        assert(lhs.isAcceptableShape(for: .addition, with: rhs),
               "Addition is defined for matrices with same shapes")

        return Matrix(flat: lhs.matrix ++ rhs.matrix, shape: lhs.shape)
    }

    public static func - (lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix {
        assert(lhs.isAcceptableShape(for: .substruction, with: rhs),
               "Substraction is defined for matrices with same shapes")

        return Matrix(flat: lhs.matrix -- rhs.matrix, shape: lhs.shape)
    }
}
