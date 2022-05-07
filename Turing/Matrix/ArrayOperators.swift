//
//  ArrayOperators.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

infix operator ++
infix operator --

extension Array where Element: INumber {
    static func ++ (lhs: Self, rhs: Self) -> Self {
        assert(lhs.count == rhs.count, "Addition is defined for arrays with same shapes")

        var result = lhs
        for i in 0 ..< result.count {
            result[i] += rhs[i]
        }
        return result
    }

    static func -- (lhs: Self, rhs: Self) -> Self {
        assert(lhs.count == rhs.count, "Addition is defined for arrays with same shapes")

        var result = lhs
        for i in 0 ..< result.count {
            result[i] -= rhs[i]
        }
        return result
    }
}
