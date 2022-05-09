//
//  Description.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

 extension Matrix: CustomStringConvertible {
    public var description: String {
        var str = "\n"
        for y in rowsRange {
            str += "⎟"
            for x in columnsRange {
                str += "\t" + String(describing: self[y, x])
            }
            str += "\t⎟" + "\n"
        }
        return str
    }
 }
