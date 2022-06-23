//
//  INumber.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

/// Numeric type
public protocol INumber: Comparable, ISigned, INumericDivisible {}

/// - Note:
/// All basic numeric types conform `INumber`
extension Int: INumber {}
extension Int8: INumber {}
extension Int16: INumber {}
extension Int32: INumber {}
extension Int64: INumber {}

extension Double: INumber {}
extension Float: INumber {}
