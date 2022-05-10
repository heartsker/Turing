//
//  Matrix.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

// MARK: - Types
/// Index in row or column
public typealias FlatIndex = Int

/// Index of the element in `y` row and `x` column
public typealias Index = (y: FlatIndex, x: FlatIndex)

/// Shape of the matrix with `y` rows and `x` columns
public typealias Shape = (y: FlatIndex, x: FlatIndex)

/// Matrix
public struct Matrix<T: INumber> {

    /// Direction of the array slice
    public enum Slice {
        /// Row slice
        case row
        /// Column slice
        case column
    }

    // MARK: - Public properties
    /// Number of rows
    public var dimY: FlatIndex {
        didSet {
#if TIME_OPTIMIZED
            changedShape()
#endif
        }
    }

    /// Number of columns
    public var dimX: FlatIndex {
        didSet {
#if TIME_OPTIMIZED
            changedShape()
#endif
        }
    }

    /// Shape of matrix `(rows, columns)`
    public var shape: Shape {
        (y: dimY, x: dimX)
    }

    // MARK: - Internal properties
    internal var matrix: [T] {
        didSet {
#if TIME_OPTIMIZED
            changedContents()
#endif
        }

    }
    internal var count: FlatIndex {
        dimY * dimX
    }
    internal var rowsRange: Range<FlatIndex> {
        0 ..< dimY
    }
    internal var columnsRange: Range<FlatIndex> {
        0 ..< dimX
    }
#if TIME_OPTIMIZED
    internal var isUpdateNeeded: [MatrixType: Bool] = [:]
    internal var savedTypes: [MatrixType: Bool] = [:]
#endif

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
    public init(_ matrix: [T], shape: Shape) {
        assert(shape.x * shape.y == matrix.count && (shape == (y: 0, x: 0)) == matrix.isEmpty,
               MatrixError.invalidShape.localizedDescription)
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
            return matrix[flattened(Index(y, x))]
        }
        set {
            assert(isValid(index: Index(y, x)), MatrixError.indexOutOfRange.localizedDescription)
            matrix[flattened(Index(y, x))] = newValue

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
                return Array(matrix[flattened((y: index, x: 0)) ..< flattened((y: index, x: dimX))])

            case .column:
                return (0 ..< dimY).map { row -> T in
                    matrix[flattened((y: row, x: index))]
                }
            }
        }
        set {
            switch slice {
            case .row:
                assert(newValue.count == dimX, MatrixError.invalidShape.localizedDescription)
                for (column, element) in newValue.enumerated() {
                    matrix[flattened((y: index, x: column))] = element
                }

            case .column:
                assert(newValue.count == dimY, MatrixError.invalidShape.localizedDescription)
                for (row, element) in newValue.enumerated() {
                    matrix[flattened((y: row, x: index))] = element
                }
            }
        }
    }

    // MARK: - TIME_OPTIMIZED methods
#if TIME_OPTIMIZED
    internal mutating func changedShape() {
        MatrixType.shapeDependent.forEach {
            isUpdateNeeded[$0] = true
        }
        changedShapeContents()
    }
    internal mutating func changedContents() {
        MatrixType.contentsDependent.forEach {
            isUpdateNeeded[$0] = true
        }
        changedShapeContents()
    }

    private mutating func changedShapeContents() {
        MatrixType.shapeContentsDependent.forEach {
            isUpdateNeeded[$0] = true
        }
    }
#endif

    // MARK: - Private methods
    private func isValid(index idx: Index) -> Bool {
        0 <= idx.y && idx.y < dimY &&
        0 <= idx.x && idx.x < dimX
    }
}
