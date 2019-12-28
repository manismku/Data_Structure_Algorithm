//
//  LCS.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 28/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

class LCS {
    typealias Input = (s1: String, s2: String)
    typealias Output = (lentgh: Int, seqeunce: String)

    private var input: Input
    private var output: Output
    private var matrix: Matrix<Int>!

    private var rows: Int {
        return self.input.s1.count + 1
    }

    private var columns: Int {
        return self.input.s2.count + 1
    }

    init(data: Input) {
        self.input = data
        self.output = (lentgh: 0, seqeunce: "")
        self.matrix = Matrix<Int>(rows: rows, column: columns)
    }

    private func findMax(_ a: Int, _ b: Int) -> Int {
        return (a > b) ? a : b
    }

    private func isMatching(c1: String, c2: String) -> Bool {
        return c1 == c2
    }

    private func previousDiagnoalValue(for rowIndex: Int, and colIndex: Int) -> Int {
        return matrix[rowIndex - 1, colIndex - 1]
    }

    private func previousSubproblemTop(for rowIndex: Int, and colIndex: Int) -> Int {
        return matrix[rowIndex - 1, colIndex]
    }

    private func previousSubproblemLeft(for rowIndex: Int, and colIndex: Int) -> Int {
        return matrix[rowIndex, colIndex - 1]
    }

    private func increment(value: Int, by count: Int) -> Int {
        return value + count
    }

    private func currentColValue(_ colIndex: Int) -> String {
        return String(Array(input.s2)[colIndex - 1])
    }

    private func currentRowValue(_ rowIndex: Int) -> String {
        return String(Array(input.s1)[rowIndex - 1])
    }

    private func isNotEqual(_ a: Int, _ b: Int) -> Bool {
            return a != b
    }

    private func backtrack() {
        var i = rows - 1
        var j = columns - 1
        var str = ""
        output.lentgh = matrix[i,j]
        while i > 0 && j > 0 {
            if isNotEqual(matrix[i,j], previousSubproblemTop(for: i, and: j)) {
                str += currentRowValue(i)
                i -= 1
                j -= 1
            } else {
                i -= 1
            }
        }
        output.seqeunce = String(str.reversed())

    }
}


extension LCS {
    func findLCS() -> Output {
        for rowIndex in 1..<rows {
            for colIndex in 1..<columns {
                let result = isMatching(c1: currentRowValue(rowIndex), c2: currentColValue(colIndex))
                switch result {
                case true:
                    matrix[rowIndex, colIndex] = previousDiagnoalValue(for: rowIndex, and: colIndex) + 1
                case false:
                    let a = previousSubproblemLeft(for: rowIndex, and: colIndex)
                    let b = previousSubproblemTop(for: rowIndex, and: colIndex)
                    matrix[rowIndex, colIndex]  = findMax(a, b)
                }
            }
        }
        backtrack()
        return output
    }
}
