//
//  MatrixError.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

public enum MatrixError: LocalizedError {
    case wrongShape
    case indexOutOfRange

    public var errorDescription: String? {
        switch self {
        case .wrongShape:
            return "Wrong shape"
        case .indexOutOfRange:
            return "Index out of range"
        }
    }
}
