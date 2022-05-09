//
//  EquatableTests.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 09.05.2022.
//

import XCTest
@testable import Turing

class EquatableTests: XCTestCase {

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

    func testEquatable() throws {

        // MARK: Given
        let arrayFlat = Array(array2D.joined())

        // MARK: When
        let matrix1 = Matrix(array2D)
        let matrix2 = Matrix(arrayFlat, shape: (y: 4, x: 3))
        let matrix3 = Matrix(arrayFlat, shape: (y: 3, x: 4))

        // MARK: Then
        XCTAssertEqual(matrix1, matrix2, "Wrong equate")
        XCTAssertNotEqual(matrix1, matrix3, "Wrong equate")
    }
}
