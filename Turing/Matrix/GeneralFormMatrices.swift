//
//  GeneralFormMatrices.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

public extension Matrix {

    /// Square zero matrix
    /// - Parameter dim: Creates matrix with shape `(y: dim, x: dim)`
    /// - Returns: Square zero matrix
    static func zero(_ dim: Int) -> Self {
        Self(flat: Array(repeating: T.zero, count: dim * dim), shape: (y: dim, x: dim))
    }

    /// Zero matrix
    /// - Parameter shape: Shape of the matrix
    /// - Returns: Zero matrix
    static func zero(_ shape: Index) -> Self {
        Self(flat: Array(repeating: T.zero, count: shape.y * shape.x), shape: shape)
    }

    /// Identity matrix
    /// - Note:
    /// The identity matrix looks like
    /// | 1 0 ... 0 |
    /// | 0 1 ... 0 |
    /// :       ...    :
    /// | 0 0 ... 1 |
    /// - Parameter dim: Creates matrix with shape `(y: dim, x: dim)`
    /// - Returns: Identity matrix
    static func identity(_ dim: Int) -> Self {
        var matrix = Self.zero(dim)
        for i in 0 ... dim {
            matrix[i, i] = T.one
        }
        return matrix
    }

    /// Matrix filled with some value
    /// - Parameters:
    ///   - fill: The value of every element
    ///   - shape: Shape of the matrix
    /// - Returns: Matrix filled with some value
    static func filled(with fill: T, shape: Index) -> Self {
        Self(Array(repeating: Array(repeating: fill,
                                      count: shape.x),
                     count: shape.y))
    }

    /// Matrix with elements with some property
    /// - Parameters:
    ///   - fill: Closure to define the element at `(y: dim, x: dim)`
    ///   - shape: Shape of the matrix
    /// - Returns: Matrix with elements with some property
    static func filled(_ shape: Index, with fill: (Index) -> T) -> Self {
        var result = Self.zero(shape)
        for y in result.columnsRange {
            for x in result.rowsRange {
                result[y, x] = fill((y: y, x: x))
            }
        }
        return result
    }

    /// Random filled matrix
    /// - Parameter shape: Shape of the matrix
    /// - Returns: Random filled matrix
    static func random(_ shape: Index) -> Matrix<Int> {
        var result = Matrix<Int>.zero(shape)
        for y in result.columnsRange {
            for x in result.rowsRange {
                result[y, x] = Int.random(in: Int(Int16.min) ... Int(Int16.max))
            }
        }
        return result
    }
}
