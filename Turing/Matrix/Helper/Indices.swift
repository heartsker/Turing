//
//  Indices.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

internal extension Matrix {
    func flattened(index: Index) -> FlatIndex {
        index.y * dimX + index.x
    }

    func expanded(index: FlatIndex) -> Index {
        (y: index / dimX, x: index % dimX)
    }

    func isDiagonal(index: Index) -> Bool {
        index.y == index.x
    }

    func isDiagonal(index: FlatIndex) -> Bool {
        isDiagonal(index: expanded(index: index))
    }
}
