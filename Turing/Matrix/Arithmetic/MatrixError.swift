//
//  MatrixError.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

enum MatrixError: Error {
    case wrongShape
    case indexOutOfRange

    var localizedDescription: String {
        switch self {
        case .wrongShape:
            return "Wrong shape"
        case .indexOutOfRange:
            return "Index out of range"
        }
    }
}
