//
//  IDivisible.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

/// A type that supports division between instances
public protocol INumericDivisible: INumericMultipliable {
    static func / (lhs: Self, rhs: Self) -> Self

    static func /= (lhs: inout Self, rhs: Self)
}
