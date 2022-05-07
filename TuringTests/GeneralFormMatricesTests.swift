//
//  GeneralFormMatricesTests.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 07.05.2022.
//

import XCTest
@testable import Turing

class GeneralFormMatricesTests: XCTestCase {
    func testZero() throws {
        let matrix = Matrix<Int>.zero(3)
        let correct = Matrix([[0, 0, 0], [0, 0, 0], [0, 0, 0]])

        XCTAssertEqual(matrix, correct, "Wrong 3-by-3 zero matrix")
    }

    func testIdentity() throws {
        let matrix = Matrix<Int>.identity(3)
        let correct = Matrix([[1, 0, 0], [0, 1, 0], [0, 0, 1]])

        print(matrix.matrix)

        XCTAssertEqual(matrix, correct, "Wrong 3-by-3 identity matrix")
    }
}
