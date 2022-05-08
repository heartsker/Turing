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
}

extension Int: INumber {}
extension Double: INumber {}
