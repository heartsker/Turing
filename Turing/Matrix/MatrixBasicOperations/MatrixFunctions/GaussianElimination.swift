//
//  GaussianElimination.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

public extension Matrix {
    /// Eliminates the matrix
    /// - Returns: Eliminated matrix
    func gaussianElimination() -> Matrix {

        assert(dimX >= dimY, MatrixError.invalidShape.localizedDescription)

        var matrix = self

        for y in 0 ..< dimY - 1 where matrix[y, y] != T.zero {
            for x in y ..< dimY - 1 {
                let factor = matrix[x + 1, y] / matrix[y, y]

                for z in y ..< dimX {
                    matrix[x + 1, z] -= factor * matrix[y, z]
                }
            }
        }

        for y in (1 ..< dimY).reversed() where matrix[y, y] != T.zero {
            for x in (1 ..< y + 1).reversed() {
                let factor = matrix[x - 1, y] / matrix[y, y]

                for z in (0 ..< dimX).reversed() {
                    matrix[x - 1, z] -= factor * matrix[y, z]
                }
            }
        }

        for y in rowsRange {
            if matrix[y, y] != T.zero {
                matrix[.row, y] /= matrix[y, y]
            }
        }

        return matrix
    }

    /// Solves the system of linear equations
    /// - Parameters:
    ///   - matrix: Matrix of the equations system
    ///   - vector: Result vector
    /// - Returns: Solution vector
    func solveSystem(_ matrix: Matrix, for vector: Vector<T>) -> Vector<T>? {
        assert(matrix.dimY == vector.count, MatrixError.invalidShape.localizedDescription)

        let eliminated = (matrix | vector).gaussianElimination()

        if eliminated.rowsRange.contains(where: { eliminated[$0, $0] == T.zero }) {
            return nil
        }

        return eliminated[.column, eliminated.dimX - 1]
    }
 }
