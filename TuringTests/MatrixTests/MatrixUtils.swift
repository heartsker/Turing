//
//  MatrixUtils.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 09.05.2022.
//

import XCTest
@testable import Turing

class MatrixUtilsTests: XCTestCase {

    let array2D: [[Int]] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [10, 11, 12]
    ]

    func testForEach() throws {

        // MARK: Given
        let correctArray = [
            [0, 1, 2],
            [1, 2, 3],
            [2, 3, 4],
            [3, 4, 5]
        ]

        // MARK: When
        let correct = Matrix(correctArray)
        var matrix = Matrix(array2D)
        matrix.forEach { (y, x) in
            matrix[y, x] = y + x
        }

        // MARK: Then

        XCTAssertEqual(matrix, correct, "Wrong forEach")
    }

    func testMap() throws {

        // MARK: Given
        let correctArray = [
            [0, 1, 2],
            [1, 2, 3],
            [2, 3, 4],
            [3, 4, 5]
        ]

        // MARK: When
        let correct = Matrix(correctArray)
        let matrix = Matrix(array2D).map { (y, x) in
            y + x
        }

        // MARK: Then

        XCTAssertEqual(matrix, correct, "Wrong map")
    }
}
