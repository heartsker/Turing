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



        var bestScore = 0
        var best: Matrix<Double>!

        await Timer.measure("No saving type") {
            var matrix = Matrix(Array<Double>.random(9, from: -10, to: 10), shape: (y: 3, x: 3))
            let types = matrix.types
            if types.count > bestScore {
                best = matrix
                bestScore = types.count
            }
        }
        print(best!)
    }
}
