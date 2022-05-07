//
//  DescriptionTests.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 07.05.2022.
//

import XCTest
@testable import Turing

class DescriptionTests: XCTestCase {
    func testDescription() throws {
        let matrix = Matrix([[1, 2, 3], [10, 11, 12], [101, 102, 103]])

        print(matrix)
    }
}
