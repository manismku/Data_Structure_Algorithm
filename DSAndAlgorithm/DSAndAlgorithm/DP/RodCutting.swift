//
//  RodCutting.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 27/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


class Rodcutting {
    typealias Input = (totalCapacity: Int, sizes: [Int], values: [Int])
    typealias Output = (maxValue: Int, lengths: [Int])
    //input & output
    private var output: Output
    private var input: Input

    //stored property
    private var matrix: Matrix<Int>!

    //computed property (single source of truth for rows and columns)
    private var columns: Int {
        return input.totalCapacity + 1
    }
    private var rows: Int {
        return input.sizes.count + 1
    }
    private var bottomRightCell: (Int, Int) {
        return (rows - 1, columns - 1)
    }

    // initialzer
    init(data: Input) {
        self.input = data
        self.output =  (maxValue: 0, lengths: [])
        self.matrix = Matrix<Int>(rows: self.rows, column: self.columns)
    }

    private func currentLength(_ rowIndex: Int) -> Int {
        return (rowIndex == 0) ? 0 : self.input.sizes[rowIndex - 1]
    }

    private func currentValue(_ rowIndex: Int) -> Int {
        return (rowIndex == 0) ? 0 : self.input.values[rowIndex - 1]
    }

    private func currentCapacity(_ columnIndex: Int) -> Int {
        return columnIndex
    }

    private func findMax(_ a: Int, _ b: Int) -> Int {
        return (a > b) ? a : b
    }

    private func backtrack() {
         self.output.maxValue = matrix[bottomRightCell.0, bottomRightCell.1]
    }
}


//MARK:- Bottom-up approach - DP
extension Rodcutting {
    func solveRodCutting() -> Output? {
        for rowIndex in 1..<self.rows {
            for colIndex in 1..<self.columns {
                if currentLength(rowIndex) > currentCapacity(colIndex) {
                    matrix[rowIndex, colIndex] = matrix[rowIndex - 1, colIndex]
                } else {
                    let prev = matrix[rowIndex - 1, colIndex]
                    let remaining = (colIndex - rowIndex)
                    let current = currentValue(rowIndex) + matrix[rowIndex, remaining]
                    matrix[rowIndex, colIndex] = findMax(current, prev)
                }
            }
        }

        backtrack()
        return output
    }

}
