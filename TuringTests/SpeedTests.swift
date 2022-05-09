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
        Timer.repeates = 1000

        await Timer.measure("") {

        }
    }
}
