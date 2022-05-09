//
//  Submatrix.swift
//  Turing
//
//  Created by Daniel Pustotin on 09.05.2022.
//

public extension Matrix {
    /// Generates new matrix by excluding selected rows and columns
    /// - Parameters:
    ///   - rows: Set of rows to exclude
    ///   - columns: Set of columns to exclude
    /// - Returns: Matrix without excluded rows and columns
    func submatrixExcluding(rows: Set<FlatIndex>, columns: Set<FlatIndex>) -> Matrix {
        if rows.count + columns.count > (dimY + dimX + 1) / 2 {
            return submatrixIncluding(rows: Set(rowsRange).subtracting(rows),
                                      columns: Set(columnsRange).subtracting(columns))
        }
        let content = matrix.indices.filter { idx in
            !rows.contains(expanded(index: idx).y) &&
            !columns.contains(expanded(index: idx).x)
        }.map { idx in
            matrix[idx]
        }
        return Matrix(content, shape: (y: dimY - rows.count, x: dimX - columns.count))
    }

    /// Generates new matrix including only selected rows and columns
    /// - Parameters:
    ///   - rows: Set of rows to include
    ///   - columns: Set of columns to include
    /// - Returns: Matrix with only include rows and columns
    func submatrixIncluding(rows: Set<FlatIndex>, columns: Set<FlatIndex>) -> Matrix {
        if rows.count + columns.count > (dimY + dimX + 1) / 2 {
            return submatrixExcluding(rows: Set(rowsRange).subtracting(rows),
                                      columns: Set(columnsRange).subtracting(columns))
        }
        let content = matrix.indices.filter { idx in
            rows.contains(expanded(index: idx).y) ||
            columns.contains(expanded(index: idx).x)
        }.map { idx in
            matrix[idx]
        }
        return Matrix(content, shape: (y: rows.count, x: columns.count))
    }
}
