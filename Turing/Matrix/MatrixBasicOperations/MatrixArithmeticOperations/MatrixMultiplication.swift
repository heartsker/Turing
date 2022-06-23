//
//  Multiplication.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Matrix: IMultipliable {

    public static func * (lhs: Matrix, rhs: Matrix) -> Matrix {
        assert(lhs.isAcceptableShape(for: .multiplication, with: rhs), MatrixError.invalidShape.localizedDescription)

        var result = Matrix.filled(with: T.zero, shape: (y: lhs.dimY, x: rhs.dimX))
        for y in 0 ..< result.dimY {
            for x in 0 ..< result.dimX {
                for z in 0 ..< lhs.dimX {
                    result[y, x] += lhs[y, z] * rhs[z, x]
                }
            }
        }
        return result
    }
}
