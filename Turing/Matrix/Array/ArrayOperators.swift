//
//  ArrayOperators.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

infix operator ++
infix operator --

public extension Array where Element: INumber {

    /// Linear sum of two arrays
    /// - Parameters:
    ///   - lhs: First array
    ///   - rhs: Second array
    /// - Returns: Array which elements are equal to sum of corresponding elements from first and second arrays
    static func ++ (lhs: Self, rhs: Self) -> Self {
        assert(lhs.count == rhs.count, MatrixError.wrongShape.localizedDescription)

        return lhs.indices.map {
            lhs[$0] + rhs[$0]
        }
    }

    /// Linear difference of two arrays
    /// - Parameters:
    ///   - lhs: First array
    ///   - rhs: Second array
    /// - Returns: Array which elements are equal to difference of corresponding elements from first and second arrays
    static func -- (lhs: Self, rhs: Self) -> Self {
        assert(lhs.count == rhs.count, MatrixError.wrongShape.localizedDescription)

        return lhs.indices.map {
            lhs[$0] - rhs[$0]
        }
    }

    /// Dot product with another array
    /// - Parameter other: Array to find dot product with
    /// - Returns: Sum of products of corresponding elements' pairs
    func dot(_ other: [Element]) -> Element {
        assert(count == other.count, MatrixError.wrongShape.localizedDescription)

        return indices.map {
            self[$0] * other[$0]
        }.reduce(Element.zero, { $0 + $1 })
    }
}
