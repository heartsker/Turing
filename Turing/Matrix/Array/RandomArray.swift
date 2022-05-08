//
//  RandomArray.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

extension Array {
    static func random(_ count: Int, from: Int = Int(Int16.min), to: Int = Int(Int16.max)) -> [Int] {
        var array: [Int] = []
        for _ in 0 ..< count {
            array.append(Int.random(in: from ... to))
        }
        return array
    }
}
