//
//  AcceptableShape.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

extension Matrix {
    internal enum Operation {
        case addition
        case substruction
        case multiplication
    }

    internal func isAcceptableShape(for operation: Operation, with other: Matrix) -> Bool {
        switch operation {
        case .addition, .substruction:
            return self.shape == other.shape

        case .multiplication:
            return self.dimX == other.dimY
        }
    }
}
