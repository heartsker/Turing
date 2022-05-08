//
//  Matrix.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

/// Matrix
public struct Matrix<T: INumber> {

    // MARK: - Types
    /// Index in row or column
    public typealias FlatIndex = Int

    /// Index of the element in `y` row and `x` column
    public typealias Index = (y: FlatIndex, x: FlatIndex)

    /// Direction of the array slice
    public enum Slice {
        /// Row slice
        case row
        /// Column slice
        case column
    }

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
    subscript(i: FlatIndex, j: FlatIndex) -> T {
        get {
            assert(isValid(index: Index(i, j)),
                   MatrixError.indexOutOfRange.localizedDescription)
            return matrix[flattened(index: Index(i, j))]
        }
        set {
            assert(isValid(index: Index(i, j)),
                   MatrixError.indexOutOfRange.localizedDescription)
            matrix[flattened(index: Index(i, j))] = newValue
        }
    }

    subscript(_ direction: Slice, number: FlatIndex) -> [T] {
        get {
            switch direction {
            case .row:
                assert(isValid(index: (number, 0)),
                       MatrixError.indexOutOfRange.localizedDescription)
                return Array(matrix[flattened(index: (y: number, x: 0)) ..< flattened(index: (y: number, x: dimX))])

            case .column:
                assert(isValid(index: (number, 0)),
                       MatrixError.indexOutOfRange.localizedDescription)
                return (0 ..< dimY).map { row -> T in
                    matrix[flattened(index: (y: row, x: number))]
                }
            }
        }
        set {
            switch direction {
            case .row:
              assert(newValue.count == dimX,
                     MatrixError.wrongShape.localizedDescription)
              for (column, element) in newValue.enumerated() {
                matrix[flattened(index: (y: number, x: column))] = element
              }

            case .column:
                assert(newValue.count == dimY,
                       MatrixError.wrongShape.localizedDescription)
              for (row, element) in newValue.enumerated() {
                matrix[flattened(index: (y: row, x: number))] = element
              }
            }
        }
    }

    // MARK: - Public methods

    /// Applies closure to every element in the matrix
    /// - Parameter completion: Closure to apply
    public func forEach(_ completion: (Index) throws -> Void) rethrows {
      for row in rowsRange {
        for column in columnsRange {
            try completion((y: row, x: column))
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
}

extension Matrix: Equatable {
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        lhs.matrix == rhs.matrix
    }
}
