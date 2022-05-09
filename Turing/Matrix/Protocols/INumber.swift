//
//  INumber.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

public protocol INumber: AdditiveArithmetic, IMultipliable {

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

    /// Such value that
    /// `one` + `negativeOne` == `zero`
    /// and
    /// `negativeOne` + `one` == `zero`
    public static var negativeOne: Self {
        Self(-1)
    }

    /// Unary minus operator
    /// - Parameter number: Number to negate
    /// - Returns: Negated number
    public static prefix func - (number: Self) -> Self {
        number * negativeOne
    }
}

extension Int: INumber {}
extension Double: INumber {}
