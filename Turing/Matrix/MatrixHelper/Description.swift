//
//  Description.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

 extension Matrix: CustomStringConvertible {
    public var description: String {
        let len = String(describing: matrix.max()).count
        var str = "\n"
        for y in rowsRange {
            str += "⎟"
            for x in columnsRange {
                str +=
                "\t" +
                String(repeating: " ", count: len - String(describing: self[y, x]).count) +
                String(describing: self[y, x])
            }
            str += "\t⎟" + "\n"
        }
        return str
    }
 }
