//
//  MatrixDiagonal.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

public extension Matrix {
    /// Main diagonal elements
    var mainDiagonal: [T] {
        var result: [T] = []
        for i in 0 ..< min(dimY, dimX) {
            result.append(self[i, i])
        }
        return result
    }
}
