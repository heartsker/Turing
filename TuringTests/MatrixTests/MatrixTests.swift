//
//  MatrixTests.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 09.05.2022.
//

import XCTest
@testable import Turing

class MatrixTests: XCTestCase {

    let array2D = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [10, 11, 12]
    ]

    func testInitArray2D() throws {

        // MARK: Given
        let arrayFlat = Array(array2D.joined())

        // MARK: When
        let matrix = Matrix(array2D)

        // MARK: Then
        XCTAssertEqual(matrix.dimY, 4, "Wrong Y dimention")
        XCTAssertEqual(matrix.dimX, 3, "Wrong X dimention")
        XCTAssert(matrix.shape == (y: 4, x: 3), "Wrong shape")

        XCTAssertEqual(matrix.matrix, arrayFlat, "Wrong matrix")
        XCTAssertEqual(matrix.count, arrayFlat.count, "Wrong count")
        XCTAssertEqual(matrix.rowsRange, (0 ..< 4), "Wrong rowsRange")
        XCTAssertEqual(matrix.columnsRange, (0 ..< 3), "Wrong rowsRange")
    }

    func testInitArray2DEmpty() throws {

        // MARK: Given

        // MARK: When
        let matrix = Matrix([[Int]]())

        // MARK: Then
        XCTAssertEqual(matrix.dimY, 0, "Wrong Y dimention")
        XCTAssertEqual(matrix.dimX, 0, "Wrong X dimention")
        XCTAssert(matrix.shape == (y: 0, x: 0), "Wrong shape")

        XCTAssertEqual(matrix.matrix, [], "Wrong matrix")
        XCTAssertEqual(matrix.count, [].count, "Wrong count")
        XCTAssertEqual(matrix.rowsRange, (0 ..< 0), "Wrong rowsRange")
        XCTAssertEqual(matrix.columnsRange, (0 ..< 0), "Wrong rowsRange")
    }

    func testInitFlatArray() throws {

        // MARK: Given
        let arrayFlat = Array(array2D.joined())

        // MARK: When
        let matrix = Matrix(arrayFlat, shape: (y: 4, x: 3))

        // MARK: Then
        XCTAssertEqual(matrix.dimY, 4, "Wrong Y dimention")
        XCTAssertEqual(matrix.dimX, 3, "Wrong X dimention")
        XCTAssert(matrix.shape == (y: 4, x: 3), "Wrong shape")

        XCTAssertEqual(matrix.matrix, arrayFlat, "Wrong matrix")
        XCTAssertEqual(matrix.count, arrayFlat.count, "Wrong count")
        XCTAssertEqual(matrix.rowsRange, (0 ..< 4), "Wrong rowsRange")
        XCTAssertEqual(matrix.columnsRange, (0 ..< 3), "Wrong rowsRange")
    }

    func testInitFlatArrayEmpty() throws {

        // MARK: Given

        // MARK: When
        let matrix = Matrix([Int](), shape: (y: 0, x: 0))

        // MARK: Then
        XCTAssertEqual(matrix.dimY, 0, "Wrong Y dimention")
        XCTAssertEqual(matrix.dimX, 0, "Wrong X dimention")
        XCTAssert(matrix.shape == (y: 0, x: 0), "Wrong shape")

        XCTAssertEqual(matrix.matrix, [], "Wrong matrix")
        XCTAssertEqual(matrix.count, [].count, "Wrong count")
        XCTAssertEqual(matrix.rowsRange, (0 ..< 0), "Wrong rowsRange")
        XCTAssertEqual(matrix.columnsRange, (0 ..< 0), "Wrong rowsRange")
    }

    func testSubscriptElementGet() throws {

        // MARK: Given

        // MARK: When
        let matrix = Matrix(array2D)

        // MARK: Then
        for y in matrix.rowsRange {
            for x in matrix.columnsRange {
                XCTAssertEqual(matrix[y, x], array2D[y][x], "Wrong subscript element get")
            }
        }
    }

    func testSubscriptElementSet() throws {

        // MARK: Given
        let another2D = array2D.map {
            $0.map({ $0 * 2 - 10})
        }

        // MARK: When
        var matrix = Matrix(array2D)
        let correct = Matrix(another2D)

        for y in matrix.rowsRange {
            for x in matrix.columnsRange {
                matrix[y, x] = another2D[y][x]
            }
        }

        // MARK: Then
        XCTAssertEqual(matrix, correct, "Wrong subscript element set")
    }

    func testSubscriptSliceGet() throws {

        // MARK: Given

        // MARK: When
        let matrix = Matrix(array2D)

        // MARK: Then
        for y in matrix.rowsRange {
            for x in matrix.columnsRange {
                XCTAssertEqual(matrix[.row, y][x], array2D[y][x], "Wrong subscript row get")
                XCTAssertEqual(matrix[.column, x][y], array2D[y][x], "Wrong subscript column get")
            }
        }
    }

    func testSubscriptSliceSet() throws {

        // MARK: Given
        let another2D = array2D.map {
            $0.map({ $0 * 2 - 10})
        }

        // MARK: When
        var matrix1 = Matrix(array2D)
        var matrix2 = Matrix(array2D)
        let correct = Matrix(another2D)

        for y in matrix1.rowsRange {
            matrix1[.row, y] = another2D[y]
        }

        for x in matrix2.columnsRange {
            var column: [Int] = []
            for y in matrix2.rowsRange {
                column.append(another2D[y][x])
            }
            matrix2[.column, x] = column
        }

        // MARK: Then
        XCTAssertEqual(matrix1, correct, "Wrong subscript row set")
        XCTAssertEqual(matrix2, correct, "Wrong subscript column set")
    }
}
