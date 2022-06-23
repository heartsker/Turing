//
//  MatrixType.swift
//  Turing
//
//  Created by Daniel Pustotin on 10.05.2022.
//

public enum MatrixType: CustomStringConvertible, CaseIterable {

    // MARK: - Shape
    case empty
    case square

    // MARK: - Contents
    case zero

    // MARK: - Both
    case diagonal
    case identical
    case lowerTriangular
    case upperTriangular
    case symmetric
    case skewSymmetric
    case invertible

    public var description: String {
        let str = String(describing: self)
        return str.prefix(1).uppercased() + str.lowercased().dropFirst()
    }

    public static var shapeDependent: [MatrixType] = [.empty,
                                                      .square]
    public static var contentsDependent: [MatrixType] = [.zero]
    public static var shapeContentsDependent: [MatrixType] = [.diagonal,
                                                              .identical,
                                                              .lowerTriangular,
                                                              .upperTriangular,
                                                              .symmetric,
                                                              .skewSymmetric,
                                                              .invertible]
}
