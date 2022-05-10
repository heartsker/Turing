//
//  MatrixError.swift
//  Turing
//
//  Created by Daniel Pustotin on 08.05.2022.
//

public enum MatrixError: LocalizedError {
    case invalidShape
    case indexOutOfRange
    case incorrectType(expected: MatrixType)

    public var errorDescription: String? {
        switch self {
        case .invalidShape:
            return "Invalid shape"
        case .indexOutOfRange:
            return "Index out of range"
        case let .incorrectType(type):
            return "Incorrect type: expected \(type)"
        }
    }
}
