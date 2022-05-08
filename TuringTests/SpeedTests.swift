//
//  SpeedTests.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 08.05.2022.
//

import XCTest
@testable import Turing

class SpeedTests: XCTestCase {

    func testSpeed() async throws {
        Timer.repeates = 10000

        await Timer.measure("Class Matrix") {

        }

        let dim = 10
        let shape = (y: dim, x: dim)
        var m = Matrix<Int>.random(shape)

        await Timer.measure("Class Matrix") {
            m.transpose()
        }
    }

}
