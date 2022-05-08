//
//  GeneralFormMatrices.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

extension Matrix {
    static func zero(_ dim: Int) -> Self {
        Self(flat: Array(repeating: T.zero, count: dim * dim), shape: (y: dim, x: dim))
    }

    static func zero(_ shape: Index) -> Self {
        Self(flat: Array(repeating: T.zero, count: shape.y * shape.x), shape: shape)
    }

    static func identity(_ dim: Int) -> Self {
        var matrix = Self(Array(repeating: Array(repeating: T.zero, count: dim), count: dim))
        for i in 0 ... dim {
            matrix[i, i] = T.one
        }
        return matrix
    }

    static func filled(with fill: T, shape: Index) -> Self {
        Self(Array(repeating: Array(repeating: fill,
                                      count: shape.x),
                     count: shape.y))
    }
}
