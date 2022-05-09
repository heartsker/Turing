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
    internal var rowsRange: Range<FlatIndex> {
        0 ..< dimY
    }
    internal var columnsRange: Range<FlatIndex> {
        0 ..< dimX
    }

    // MARK: - Initialization
    /// Initializes matrix from two-dimensional array
    /// - Parameter matrix: 2D array to form the matrix
    public init(_ matrix: Array2D<T>) {
        self.matrix = Array(matrix.joined())
        dimY = matrix.count
        dimX = matrix.isEmpty ? 0 : matrix[0].count
    }

    /// Initializes matrix from flat array
    /// - Parameters:
    ///   - matrix: Flat array to form the matrix
    ///   - shape: Shape of the matrix
    public init(_ matrix: [T], shape: Index) {
        assert(shape.x * shape.y == matrix.count && (shape == (y: 0, x: 0)) == matrix.isEmpty,
               MatrixError.wrongShape.localizedDescription)
        self.matrix = matrix
        dimY = shape.y
        dimX = shape.x
    }

    // MARK: - Subscripting
    /// Subscripting
    /// - Parameter y: Row index
    /// - Parameter x: Column index
    /// - Returns: Element at index `[y, x]`
    public subscript(y: FlatIndex, x: FlatIndex) -> T {
        get {
            assert(isValid(index: Index(y, x)), MatrixError.indexOutOfRange.localizedDescription)
            return matrix[flattened(index: Index(y, x))]
        }
        set {
            assert(isValid(index: Index(y, x)), MatrixError.indexOutOfRange.localizedDescription)
            matrix[flattened(index: Index(y, x))] = newValue
        }
    }

    /// Subscripting
    /// - Parameter slice: `row` or `column`
    /// - Parameter index: Slice index
    /// - Returns: Slice at index `index`
    public subscript(_ slice: Slice, _ index: FlatIndex) -> [T] {
        get {

            assert(isValid(slice, index: index), MatrixError.indexOutOfRange.localizedDescription)
            switch slice {
            case .row:
                return Array(matrix[flattened(index: (y: index, x: 0)) ..< flattened(index: (y: index, x: dimX))])

            case .column:
                return (0 ..< dimY).map { row -> T in
                    matrix[flattened(index: (y: row, x: index))]
                }
            }
        }
        set {
            switch slice {
            case .row:
                assert(newValue.count == dimX, MatrixError.wrongShape.localizedDescription)
                for (column, element) in newValue.enumerated() {
                    matrix[flattened(index: (y: index, x: column))] = element
                }

            case .column:
                assert(newValue.count == dimY, MatrixError.wrongShape.localizedDescription)
                for (row, element) in newValue.enumerated() {
                    matrix[flattened(index: (y: row, x: index))] = element
                }
            }
        }
    }

    // MARK: - Private methods
    private func isValid(index idx: Index) -> Bool {
        0 <= idx.y && idx.y < dimY &&
        0 <= idx.x && idx.x < dimX
    }
}
