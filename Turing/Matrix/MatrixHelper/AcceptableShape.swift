//
//  AcceptableShape.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

internal extension Matrix {
    enum Operation {
        case addition
        case subtruction
        case multiplication
    }

    func isAcceptableShape(for operation: Operation, with other: Matrix) -> Bool {
        switch operation {
        case .addition, .subtruction:
            return self.shape == other.shape

        case .multiplication:
            return self.dimX == other.dimY
        }
    }
}
