//
//  Timer.swift
//  TuringTests
//
//  Created by Daniel Pustotin on 08.05.2022.
//

import Foundation

class Timer {
    private static var start: DispatchTime?

    public static var repeates: Int = 1

    public static var setup: () -> Void = { }

    @inlinable public static func tic() {
        start = DispatchTime.now()
    }

    @inlinable public static func tac(_ title: String) {
        let now = DispatchTime.now()

        guard let start = start else {
            return
        }

        let diff = Double(now.uptimeNanoseconds - start.uptimeNanoseconds) / Double(repeates) /  1_000_000
        print("⏰ [\(title)] \ttook\t\(diff) ms")
    }

    public static func measure(_ title: String, average repeates: Int = repeates, _ completion: () async -> Void) async {
        Timer.tic()

        for _ in 0 ..< repeates {
            setup()
            await completion()
        }

        Timer.tac(title)
    }
}

