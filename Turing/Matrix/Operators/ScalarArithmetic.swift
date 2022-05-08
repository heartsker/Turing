//
//  ScalarArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Matrix: IScalarArithmetic {
    public static func + (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 + rhs }), shape: lhs.shape)
    }

    public static func + (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs + $0 }), shape: rhs.shape)
    }

    public static func - (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 - rhs }), shape: lhs.shape)
    }

    public static func - (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs - $0 }), shape: rhs.shape)
    }

    public static func * (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 * rhs }), shape: lhs.shape)
    }

    public static func * (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs * $0 }), shape: rhs.shape)
    }

    public static func / (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 / rhs }), shape: lhs.shape)
    }

    public static func / (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs / $0 }), shape: rhs.shape)
    }
}
