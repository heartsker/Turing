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

    public func multiply(by other: Matrix) -> Matrix {
        assert(isAcceptableShape(for: .multiplication, with: other),
               MatrixError.wrongShape.localizedDescription)
        var result = Matrix.filled(with: T.zero, shape: (y: dimY, x: other.dimX))
        for y in 0 ..< result.dimY {
            for x in 0 ..< result.dimX {
                for i in 0 ..< dimX {
                    result[y, x] += self[y, i] * other[i, x]
                }
            }
        }
        return result
    }

    public static func multiply(_ lhs: Matrix, by rhs: Matrix) -> Matrix {
        lhs.multiply(by: rhs)
    }

    public static func * (lhs: Matrix, rhs: Matrix) -> Matrix {
        lhs.multiply(by: rhs)
    }
}
