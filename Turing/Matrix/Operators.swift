//
//  Operators.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

extension Matrix {
    private enum Operation {
        case addition
        case substruction
        case multiplication
    }

    private func isAcceptableDim(for operation: Operation, with other: Matrix) -> Bool {
        switch operation {
        case .addition, .substruction:
            return self.shape == other.shape

        case .multiplication:
            return self.dimX == other.dimY
        }
    }
}

extension Matrix: AdditiveArithmetic {
    public static var zero: Matrix<T> {
        zero(0)
    }

    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        assert(lhs.isAcceptableDim(for: .addition, with: rhs), "Addition is defined for matrices with same shapes")

        return Matrix(flat: lhs.matrix ++ rhs.matrix, shape: lhs.shape)
    }

    public static func - (lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix {
        assert(lhs.isAcceptableDim(for: .substruction,
                                   with: rhs), "Substraction is defined for matrices with same shapes")

        return Matrix(flat: lhs.matrix -- rhs.matrix, shape: lhs.shape)
    }
}

extension Matrix: IMultiplicative {
    public static var one: Matrix<T> {
        identity(0)
    }

    public static func * (lhs: Matrix<T>, rhs: Matrix<T>) -> Self {
        assert(lhs.isAcceptableDim(for: .multiplication,
                                   with: rhs), "Multiplication is defined for matrices with same shapes")

        let result = Self.filled(with: T.zero, shape: (y: lhs.dimY, x: rhs.dimX))
        for y in 0 ..< result.dimY {
            for x in 0 ..< result.dimX {
                var sum = T.zero
                for i in 0 ..< lhs.dimX {
                    sum += (lhs[y, i] ?? T.zero) * (rhs[i, x] ?? T.zero)
                }
                result[y, x] = sum
            }
        }
        return result
    }

}

extension Matrix: IScalarArithmetic {

    public static func + (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 + rhs }), shape: lhs.shape)
    }

    public static func + (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs + $0 }), shape: rhs.shape)
    }

    public static func - (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 - rhs }), shape: lhs.shape)
    }

    public static func - (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs - $0 }), shape: rhs.shape)
    }

    public static func * (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 * rhs }), shape: lhs.shape)
    }

    public static func * (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs * $0 }), shape: rhs.shape)
    }

    public static func / (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
        Matrix(flat: lhs.matrix.map({ $0 / rhs }), shape: lhs.shape)
    }

    public static func / (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
        Matrix(flat: rhs.matrix.map({ lhs / $0 }), shape: rhs.shape)
    }

}
