//
//  IMultipliable.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

/// A type with values that support multiplication
public protocol IMultipliable {

    /// Such value that
    /// `x` * `one` == `x`
    /// and
    /// `one` * `x` == `x`
    /// for any `x`
    static var one: Self { get }

    /// Multiplication
    /// - Parameters:
    ///   - lhs: First argument
    ///   - rhs: Second argument
    /// - Returns: Result of multiplication
    static func * (lhs: Self, rhs: Self) -> Self

    /// Multiplication
    /// - Parameters:
    ///   - lhs: First argument
    ///   - rhs: Second argument
    static func *= (lhs: inout Self, rhs: Self)
}
