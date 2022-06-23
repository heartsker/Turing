//
//  ISigned.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

/// A type that supports negation and have `negativeOne` constant
public protocol ISigned: SignedNumeric {
    static var negativeOne: Self { get }
}

public extension ISigned {
    /// Such value that
    /// `negativeOne` * `x` == `x` * `negativeOne`,
    /// `x`  + `negativeOne` * `x` == `zero`
    /// and
    /// `negativeOne` * `x` + `x` == `zero`
    /// for any `x`
    static var negativeOne: Self {
        // swiftlint:disable:next force_unwrapping
        Self(exactly: -1)!
    }
}
