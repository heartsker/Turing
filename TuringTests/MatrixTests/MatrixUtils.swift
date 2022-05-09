//
//  MatrixUtils.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 09.05.2022.
//

import XCTest
@testable import Turing

class MatrixUtilsTests: XCTestCase {

    let array2D = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [10, 11, 12]
    ]
    var matrix = Matrix<Int>.empty

    override func setUpWithError() throws {
        matrix = Matrix(array2D)
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
        let result = matrix.map { (y, x) in
            y + x
        }

        // MARK: Then

        XCTAssertEqual(result, correct, "Wrong map")
    }

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
        var result = matrix
        matrix.forEach { (y, x) in
            result[y, x] = y + x
        }

        // MARK: Then

        XCTAssertEqual(result, correct, "Wrong forEach")
    }
}
