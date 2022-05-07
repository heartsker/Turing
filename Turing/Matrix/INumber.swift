//
//  INumber.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

/// A type with values that support multiplication
public protocol IMultiplicative {
    /// Multiplication
    /// - Parameters:
    ///   - lhs: First argument
    ///   - rhs: Second argument
    /// - Returns: Result of multiplication
    static func * (lhs: Self, rhs: Self) -> Self

    /// Such value that
    /// `x` * `one` == `x`
    /// and
    /// `one` * `x` == `x`
    /// for any `x`
    static var one: Self { get }
}

public protocol INumber: AdditiveArithmetic, IMultiplicative {

    init(_ int: Int)

    /// Such value that
    /// `x` + `zero` == `x`
    /// and
    /// `zero` + `x` == `x`
    /// for any `x`
    static var zero: Self { get }

    static func / (lhs: Self, rhs: Self) -> Self
}

extension INumber {

    /// Such value that
    /// `x` + `zero` == `x`
    /// and
    /// `zero` + `x` == `x`
    /// for any `x`
    public static var zero: Self {
        Self(0)
    }

    /// Such value that
    /// `x` * `one` == `x`
    /// and
    /// `one` * `x` == `x`
    /// for any `x`
    public static var one: Self {
        Self(1)
    }
}

extension Int: INumber {}
extension Double: INumber {}
