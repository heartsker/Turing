//
//  GaussianEliminationTests.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 10.05.2022.
//

import XCTest
@testable import Turing

class GaussianEliminationTests: XCTestCase {

    let array2D: [[Double]] = [
        [ 2,  1, -1,   8],
        [-3, -1,  2, -11],
        [-2,  1,  2,  -3]
    ]

    func testGaussianElimination() throws {

        // MARK: Given
        let matrix = Matrix(array2D)

        // MARK: When
        let augmented = matrix.gaussianElimination()
        let correct: [[Double]] = [
            [1, 0, 0,  2],
            [0, 1, 0,  3],
            [0, 0, 1, -1]
        ]

        // MARK: Then
        XCTAssertEqual(augmented, Matrix(correct), "Wrong gaussian elimination")
        
    }
}

// TODO:
/// - Clean folders
/// - Code gauss
