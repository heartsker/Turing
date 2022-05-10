//
//  IScalarArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

/// A type that supports addition and subtraction with scalar value
public protocol IScalarArithmetic: ILinearArithmetic {

    /// Addition
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of addition scalar value to every element
    static func + (lhs: Self, rhs: T) -> Self

    /// Addition
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of addition scalar value to every element
    static func + (lhs: T, rhs: Self) -> Self

    /// Addition
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    static func += (lhs: inout Self, rhs: T)

    /// Subtraction
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of subtraction scalar value from every element
    static func - (lhs: Self, rhs: T) -> Self

    /// Subtraction
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of subtraction every element from  scalar value
    static func - (lhs: T, rhs: Self) -> Self

    /// Subtraction
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of subtraction scalar value from every element
    static func -= (lhs: inout Self, rhs: T)
}

public extension IScalarArithmetic {

    // MARK: - Addition
    /// Addition
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of addition scalar value to every element
    static func + (lhs: T, rhs: Self) -> Self {
        rhs + lhs
    }

    /// Addition
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    static func += (lhs: inout Self, rhs: T) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs + rhs
    }

    // MARK: - Subtraction
    /// Subtraction
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of subtraction every element from  scalar value
    static func - (lhs: T, rhs: Self) -> Self {
        rhs * (T.negativeOne) + lhs
    }

    /// Subtraction
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of subtraction scalar value from every element
    static func -= (lhs: inout Self, rhs: T) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs - rhs
    }
}
