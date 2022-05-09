//
//  Equatable.swift
//  Turing
//
//  Created by Daniel Pustotin on 09.05.2022.
//

extension Matrix: Equatable {
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        lhs.shape == rhs.shape && lhs.matrix == rhs.matrix
    }
}
