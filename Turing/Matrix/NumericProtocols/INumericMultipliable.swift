//
//  IMultipliable.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

/// A type with values that support multiplication
public protocol INumericMultipliable: Numeric {

    /// Such value that
    /// `x` * `one` == `x`
    /// and
    /// `one` * `x` == `x`
    /// for any `x`
    static var one: Self { get }
}

public extension INumericMultipliable {

    /// Such value that
    /// `x` * `one` == `x`
    /// and
    /// `one` * `x` == `x`
    /// for any `x`
    static var one: Self {
        // swiftlint:disable:next force_unwrapping
        Self(exactly: 1)!
    }
}
