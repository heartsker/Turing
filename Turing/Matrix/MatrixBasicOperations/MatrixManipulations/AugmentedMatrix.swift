//
//  AugmentedMatrix.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

public extension Matrix {

    /// Appends vector to the bottom or to the left of the matrix
    /// - Parameters:
    ///   - slice: `row` or `column` to append
    ///   - vector: Vector to append
    /// - Returns: Augmented matrix
    func augmented(with slice: Slice, _ vector: Vector<T>) -> Matrix {
        var result = self
        switch slice {
        case .row:
            assert(dimY == vector.count, MatrixError.invalidShape.localizedDescription)
            result.matrix.append(contentsOf: vector)
            result.dimY += 1

        case .column:
            assert(dimX == vector.count, MatrixError.invalidShape.localizedDescription)
            for y in result.rowsRange {
                result.matrix.insert(vector[y], at: (y + 1) * dimX)
            }
            result.dimX += 1
        }
        return result
    }

    /// Appends vector to the left of the matrix
    /// - Parameters:
    ///   - lhs: Matrix to augment
    ///   - rhs: Vector to augment matrix with
    /// - Returns: Augmented matrix
    static func | (lhs: Matrix, rhs: Vector<T>) -> Matrix {
        lhs.augmented(with: .column, rhs)
    }

    /// Appends vector to the left of the matrix
    /// - Parameters:
    ///   - lhs: Matrix to augment
    ///   - rhs: Vector to augment matrix with
    static func |= (lhs: inout Matrix, rhs: Vector<T>) {
        lhs = lhs | rhs
    }
}
