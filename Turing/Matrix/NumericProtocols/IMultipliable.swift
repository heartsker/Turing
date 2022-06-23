//
//  IMultipliable.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

/// A type that supports multiplication between instances
public protocol IMultipliable {
    /// Multiplication
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    /// - Returns: Result of multiplication
    static func * (lhs: Self, rhs: Self) -> Self

    /// Multiplication
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    static func *= (lhs: inout Self, rhs: Self)
}

public extension IMultipliable {

    /// Multiplication
    /// - Parameters:
    ///   - lhs: First operand
    ///   - rhs: Second operand
    static func *= (lhs: inout Self, rhs: Self) {
        // swiftlint:disable:next shorthand_operator
        lhs = lhs * rhs
    }
}
