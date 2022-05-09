//
//  ILinearArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

/// A type with values that support addition and subtraction between instances and multiplication and division by scalar value
public protocol ILinearArithmetic: AdditiveArithmetic {
    /// Type of scalar value
    associatedtype T: INumber

    /// Addition
    /// - Parameters:
    ///   - lhs: First argument - `ILinearArithmetic`
    ///   - rhs: Second argument - scalar value
    /// - Returns: Result of addition every element to scalar value
    static func + (lhs: Self, rhs: T) -> Self

    /// Addition
    /// - Parameters:
    ///   - rhs: First argument - scalar value
    ///   - lhs: Second argument - `ILinearArithmetic`
    /// - Returns: Result of addition scalar value to every element
    static func + (lhs: T, rhs: Self) -> Self

    /// Subscraction
    /// - Parameters:
    ///   - lhs: First argument - `ILinearArithmetic`
    ///   - rhs: Second argument - scalar value
    /// - Returns: Result of subscraction scalar value from every element
    static func - (lhs: Self, rhs: T) -> Self

    /// Subscraction
    /// - Parameters:
    ///   - rhs: First argument - scalar value
    ///   - lhs: Second argument - `ILinearArithmetic`
    /// - Returns: Result of subscraction scalar value from every element
    static func - (lhs: T, rhs: Self) -> Self

    /// Multiplication
    /// - Parameters:
    ///   - lhs: First argument - `ILinearArithmetic`
    ///   - rhs: Second argument - scalar value
    /// - Returns: Result of multiplication every element by scalar value
    static func * (lhs: Self, rhs: T) -> Self

    /// Multiplication
    /// - Parameters:
    ///   - rhs: First argument - scalar value
    ///   - lhs: Second argument - `ILinearArithmetic`
    /// - Returns: Result of multiplication scalar value by every element
    static func * (lhs: T, rhs: Self) -> Self

    /// Division
    /// - Parameters:
    ///   - lhs: First argument - `ILinearArithmetic`
    ///   - rhs: Second argument - scalar value
    /// - Returns: Result of division every element by scalar value
    static func / (lhs: Self, rhs: T) -> Self

    /// Division
    /// - Parameters:
    ///   - rhs: First argument - scalar value
    ///   - lhs: Second argument - `ILinearArithmetic`
    /// - Returns: Result of division scalar value by every element
    static func / (lhs: T, rhs: Self) -> Self

    /// Unary minus
    /// - Parameter matrix: Matrix to negate
    /// - Returns: Negated matrix
    static prefix func - (matrix: Self) -> Self
}
