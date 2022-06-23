//
//  AdditiveArithmetic.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Matrix: IScalarArithmetic {

    // MARK: - Addition
    public static func + (lhs: Matrix, rhs: T) -> Matrix {
        Matrix(lhs.matrix.map({ $0 + rhs }), shape: lhs.shape)
    }

    // MARK: - Subtracting
    public static func - (lhs: Matrix, rhs: T) -> Matrix {
        Matrix(lhs.matrix.map({ $0 - rhs }), shape: lhs.shape)
    }

    // MARK: - Subtraction
    func subtract(_ other: Matrix) -> Matrix {
        assert(isAcceptableShape(for: .addition, with: other), MatrixError.invalidShape.localizedDescription)

        return Matrix(matrix + other.matrix, shape: shape)
    }

    static func subtract(_ lhs: Matrix, _ rhs: Matrix) -> Matrix {
        lhs.subtract(rhs)
    }
}
