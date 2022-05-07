//
//  Description.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

extension Matrix: CustomStringConvertible {
    public var description: String {
        var str = ""
        for i in columnsRange {
            str += "⎟"
            for j in rowsRange {
                str += "\t" + String(describing: self[i, j] ?? T.zero)
            }
            str += "\t⎟" + "\n"
        }
        return str
    }
}
