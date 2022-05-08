//
//  ScalarArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Matrix: IScalarArithmetic {

    // MARK: - Addition
    public func add(_ other: T) -> Matrix {
        Matrix(flat: matrix.map({ $0 + other }), shape: shape)
    }

    public static func add(_ lhs: Matrix, to rhs: T) -> Matrix {
        lhs.add(rhs)
    }

    public static func add(_ lhs: T, to rhs: Matrix) -> Matrix {
        rhs.add(lhs)
    }

    public static func + (lhs: Matrix, rhs: T) -> Matrix {
        lhs.add(rhs)
    }

    public static func + (lhs: T, rhs: Matrix) -> Matrix {
        rhs.add(lhs)
    }

    // MARK: - Subtracting
    public func subtract(_ other: T) -> Matrix {
        Matrix(flat: matrix.map({ $0 - other }), shape: shape)
    }

    public static func subtract(_ lhs: Matrix, _ rhs: T) -> Matrix {
        lhs.subtract(rhs)
    }

    public static func subtract(_ lhs: T, _ rhs: Matrix) -> Matrix {
        rhs.subtract(lhs)
    }

    public static func - (lhs: Matrix, rhs: T) -> Matrix {
        lhs.subtract(rhs)
    }

    public static func - (lhs: T, rhs: Matrix) -> Matrix {
        rhs.subtract(lhs)
    }

    // MARK: - Multiplication
    public func multiply(_ other: T) -> Matrix {
        Matrix(flat: matrix.map({ $0 * other }), shape: shape)
    }

    public static func multiply(_ lhs: Matrix, by rhs: T) -> Matrix {
        lhs.multiply(rhs)
    }

    public static func multiply(_ lhs: T, by rhs: Matrix) -> Matrix {
        rhs.multiply(lhs)
    }

    public static func * (lhs: Matrix, rhs: T) -> Matrix {
        lhs.multiply(rhs)
    }

    public static func * (lhs: T, rhs: Matrix) -> Matrix {
        rhs.multiply(lhs)
    }

    // MARK: - Division
    public func divide(_ other: T) -> Matrix {
        Matrix(flat: matrix.map({ $0 / other }), shape: shape)
    }

    public static func divide(_ lhs: Matrix, by rhs: T) -> Matrix {
        lhs.divide(rhs)
    }

    public static func divide(_ lhs: T, by rhs: Matrix) -> Matrix {
        rhs.divide(lhs)
    }

    public static func / (lhs: Matrix, rhs: T) -> Matrix {
        lhs.divide(rhs)
    }

    public static func / (lhs: T, rhs: Matrix) -> Matrix {
        rhs.divide(lhs)
    }
}
