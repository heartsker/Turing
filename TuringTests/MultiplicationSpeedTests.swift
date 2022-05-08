//
//  MultiplicationSpeedTests.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 07.05.2022.
//

import XCTest
@testable import Turing

class MultiplicationSpeedTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() async throws {
        // This is an example of a performance test case.

        let dim = 100
        let arr1 = [Int].random(dim * dim)
        let arr2 = [Int].random(dim * dim)

//        await Timer.measure("Strassen Async") {
//            let m1 = Matrix(flat: arr1, shape: (y: dim, x: dim))
//            let m2 = Matrix(flat: arr2, shape: (y: dim, x: dim))
//
//            await _ = Matrix.strassenMultiply(lhs: m1, rhs: m2)
//        }
//
//        await Timer.measure("Strassen Sync") {
//            let m1 = Matrix(flat: arr1, shape: (y: dim, x: dim))
//            let m2 = Matrix(flat: arr2, shape: (y: dim, x: dim))
//
//            _ = Matrix.strassenMultiplySync(lhs: m1, rhs: m2)
//        }
//
//        await Timer.measure("Stupid") {
//            let m1 = Matrix(flat: arr1, shape: (y: dim, x: dim))
//            let m2 = Matrix(flat: arr2, shape: (y: dim, x: dim))
//
//            _ = m1 * m2
//        }
    }
}
