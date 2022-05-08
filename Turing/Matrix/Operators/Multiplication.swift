//
//  Multiplication.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Matrix: IMultipliable {
    public static var one: Matrix<T> {
        identity(0)
    }

    public static func * (lhs: Matrix<T>, rhs: Matrix<T>) -> Self {
        assert(lhs.isAcceptableShape(for: .multiplication, with: rhs),
               "Multiplication is defined for matrices with same shapes")

        var result = Self.filled(with: T.zero, shape: (y: lhs.dimY, x: rhs.dimX))
        for y in 0 ..< result.dimY {
            for x in 0 ..< result.dimX {
                for i in 0 ..< lhs.dimX {
                    result[y, x] += lhs[y, i] * rhs[i, x]
                }
            }
        }
        return result
    }
}
