//
//  Matrix.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

/// Matrix
public final class Matrix<T: INumber> {

    // MARK: - Types

    /// Index in row or column
    public typealias FlatIndex = Int

    /// Index of the element in `y` row and `x` column
    public typealias Index = (y: FlatIndex, x: FlatIndex)

    // MARK: - Public properties
    /// Number of rows
    public var dimY: FlatIndex

    /// Number of columns
    public var dimX: FlatIndex

    /// Shape of matrix `(rows, columns)`
    public var shape: Index {
        (y: dimY, x: dimX)
    }

    // MARK: - Internal properties
    internal var matrix: [T]
    internal var count: FlatIndex {
        dimY * dimX
    }
    internal var columnsRange: Range<FlatIndex> {
        0 ..< dimY
    }
    internal var rowsRange: Range<FlatIndex> {
        0 ..< dimX
    }

    // MARK: - Initialization
    init(_ matrix: Array2D<T>) {
        self.matrix = Array(matrix.joined())
        dimY = matrix.count
        dimX = matrix.isEmpty ? 0 : matrix[0].count
    }

    init(flat matrix: [T], shape: Index) {
        self.matrix = matrix
        dimY = shape.y
        dimX = shape.x
    }

    // MARK: - Subscripting
    subscript(i: FlatIndex, j: FlatIndex) -> T? {
        get {
            isValid(index: Index(i, j)) ? matrix[flattened(index: Index(i, j))] : nil
        }
        set {
            if isValid(index: Index(i, j)) {
                if let value = newValue {
                    matrix[flattened(index: Index(i, j))] = value
                }
            }
        }
    }

    // MARK: - Private methods
    private func isValid(index idx: Index) -> Bool {
        0 <= idx.y && idx.y < dimY &&
        0 <= idx.x && idx.x < dimX
    }

    private func isValid(flatIndex idx: FlatIndex) -> Bool {
        0 <= idx && idx < count
    }

    private func flattened(index idx: Index) -> Int {
        idx.y * dimX + idx.x
    }
}

extension Matrix: Equatable {
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        lhs.matrix == rhs.matrix
    }
}
