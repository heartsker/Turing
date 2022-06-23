//
//  ILinearArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

/// A type with values that support addition and subtraction between instances and multiplication and division by scalar value
public protocol ILinearArithmetic {
    /// Type of scalar value
    associatedtype T: INumber

    // MARK: - Addition
    /// Addition
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    /// - Returns: Result of element-by-element addition
    static func + (lhs: Self, rhs: Self) -> Self

    /// Addition
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    static func += (lhs: inout Self, rhs: Self)

    // MARK: - Subtraction
    /// Subtraction
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    /// - Returns: Result of element-by-element subtraction
    static func - (lhs: Self, rhs: Self) -> Self

    /// Subtraction
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    static func -= (lhs: inout Self, rhs: Self)

    // MARK: - Multiplication
    /// Multiplication
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of multiplication every element by scalar value
    static func * (lhs: Self, rhs: T) -> Self

    /// Multiplication
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of multiplication scalar value by every element
    static func * (lhs: T, rhs: Self) -> Self

    /// Multiplication
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of multiplication every element by scalar value
    static func *= (lhs: inout Self, rhs: T)

    // MARK: - Division
    /// Division
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of division every element by scalar value
    static func / (lhs: Self, rhs: T) -> Self

    /// Division
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of division scalar value by every element
    static func / (lhs: T, rhs: Self) -> Self

    /// Division
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    static func /= (lhs: inout Self, rhs: T)

    // MARK: - Negation
    /// Negation
    /// - Parameter operand: Operand to negate
    /// - Returns: Negated operand
    static prefix func - (operand: Self) -> Self
}

public extension ILinearArithmetic {

    // MARK: - Addition
    /// Addition
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    /// - Returns: Result of element-by-element addition
    static func += (lhs: inout Self, rhs: Self) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs + rhs
    }

    // MARK: - Subtraction
    /// Subtraction
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    /// - Returns: Result of element-by-element subtraction
    static func -= (lhs: inout Self, rhs: Self) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs - rhs
    }

    // MARK: - Multiplication
    /// Multiplication
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of multiplication scalar value by every element
    static func * (lhs: T, rhs: Self) -> Self {
        rhs * lhs
    }

    /// Multiplication
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    /// - Returns: Result of multiplication every element by scalar value
    static func *= (lhs: inout Self, rhs: T) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs * rhs
    }

    // MARK: - Division
    /// Division
    /// - Parameters:
    ///   - rhs: First operand - scalar value
    ///   - lhs: Second operand - `ILinearArithmetic`
    /// - Returns: Result of division scalar value by every element
    static func / (lhs: T, rhs: Self) -> Self {
        rhs * (T.one / lhs)
    }

    /// Division
    /// - Parameters:
    ///   - lhs: First operand - `ILinearArithmetic`
    ///   - rhs: Second operand - scalar value
    static func /= (lhs: inout Self, rhs: T) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs / rhs
    }

    // MARK: - Negation
    /// Negation
    /// - Parameter operand: Operand to negate
    /// - Returns: Negated operand
    static prefix func - (operand: Self) -> Self {
        operand * T.negativeOne
    }
}
