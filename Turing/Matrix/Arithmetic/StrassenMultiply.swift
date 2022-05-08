//
//  FastMultiplication.swift
//  Turing
//
//  Created by Daniel Pustotin on 07.05.2022.
//

extension Matrix {

    /// Multiplication of two matrices usin Strassen algorithm
    /// - Parameters:
    ///   - lhs: Left matrix
    ///   - rhs: Right matrix
    /// - Returns: Result of multiplication
    /// - Note: [Strassen Algorithm](https://en.wikipedia.org/wiki/Strassen_algorithm)
    /// - Complexity: `O(n^log 7)` ~= `O(n^2.8074)`
    public static func strassenMultiply(lhs: Matrix, rhs: Matrix) -> Matrix {

        func nextPowerOfTwo(after number: Int) -> Int {
            Int(pow(2, ceil(log2(Double(number)))))
        }

        let dim = nextPowerOfTwo(after: max(lhs.dimY, lhs.dimX, rhs.dimY, rhs.dimX))

        var aPrepared = Matrix.zero(dim)
        var bPrepared = Matrix.zero(dim)

        rhs.forEach { (i, j) in
            aPrepared[i, j] = rhs[i, j]
        }

        rhs.forEach { (i, j) in
            bPrepared[i, j] = rhs[i, j]
        }

        return aPrepared.strassenRecursive(by: bPrepared)
    }

    /// Helper function for Strassen multiplication
    /// - Parameter other: Matrix to multiply by
    /// - Returns: Result of multiplication by other matrix
    private func strassenRecursive(by other: Matrix) -> Matrix {

        guard dimY > 1 && other.dimY > 1 else {
            return self * other
        }

        let halfDim = dimY / 2

        /// - Note:
        /// All this formulas are avaliable in algorithm description

        // swiftlint:disable identifier_name
        var a = Matrix.zero(halfDim)
        var b = Matrix.zero(halfDim)
        var c = Matrix.zero(halfDim)
        var d = Matrix.zero(halfDim)
        var e = Matrix.zero(halfDim)
        var f = Matrix.zero(halfDim)
        var g = Matrix.zero(halfDim)
        var h = Matrix.zero(halfDim)
        // swiftlint:enable identifier_name

        for i in 0 ..< halfDim {
            for j in 0 ..< halfDim {
                a[i, j] = self[i, j]
                b[i, j] = self[i, j+halfDim]
                c[i, j] = self[i + halfDim, j]
                d[i, j] = self[i + halfDim, j + halfDim]
                e[i, j] = other[i, j]
                f[i, j] = other[i, j + halfDim]
                g[i, j] = other[i + halfDim, j]
                h[i, j] = other[i + halfDim, j + halfDim]
            }
        }

        // swiftlint:disable identifier_name
        let p1 = a.strassenRecursive(by: f - h)         // a * (f - h)
        let p2 = (a + b).strassenRecursive(by: h)       // (a + b) * h
        let p3 = (c + d).strassenRecursive(by: e)       // (c + d) * e
        let p4 = d.strassenRecursive(by: g - e)         // d * (g - e)
        let p5 = (a + d).strassenRecursive(by: e + h)   // (a + d) * (e + h)
        let p6 = (b - d).strassenRecursive(by: g + h)   // (b - d) * (g + h)
        let p7 = (a - c).strassenRecursive(by: e + f)   // (a - c) * (e + f)
        // swiftlint:enable identifier_name

        let c11 = p5 + p4 - p2 + p6 // p5 + p4 - p2 + p6
        let c12 = p1 + p2           // p1 + p2
        let c21 = p3 + p4           // p3 + p4
        let c22 = p1 + p5 - p3 - p7 // p1 + p5 - p3 - p7

        var result = Matrix.zero(dimY)
        for i in 0 ..< halfDim {
            for j in 0 ..< halfDim {
                result[i, j] = c11[i, j]
                result[i, j + halfDim] = c12[i, j]
                result[i + halfDim, j] = c21[i, j]
                result[i + halfDim, j + halfDim] = c22[i, j]
            }
        }
        return result
    }
}
