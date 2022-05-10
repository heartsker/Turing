//
//  Indices.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

internal extension Matrix {
    func flattened(_ index: Index) -> FlatIndex {
        index.y * dimX + index.x
    }

    func expanded(_ index: FlatIndex) -> Index {
        (y: index / dimX, x: index % dimX)
    }

    func isOnDiagonal(_ index: Index) -> Bool {
        index.y == index.x
    }

    func isOnDiagonal(_ index: FlatIndex) -> Bool {
        isOnDiagonal(expanded(index))
    }
}
