//
//  Matrix.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 26/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

struct Matrix<T> {

    // value to hold the grid
    private var grid: [Int]

    let rows: Int, cols: Int

    init(rows: Int, column: Int) {
        self.rows = rows
        self.cols = column
        self.grid = Array(repeating: 0, count: rows * cols)
    }

    func printMatrix() {
        for i in 0...self.rows {
            var out = ""
            for j in 0...self.cols {
                out += " " + String(self.grid[i*cols + j])
            }
            print("\(out)")
            print("\n")
        }
    }
}


//MARK:- Access the matrix using subscript
extension Matrix {
    subscript(row: Int, col: Int) -> Int {
        // getter and setter for matrix
        get{
            assert(isValidRowAndColumn(row: row, col: col), "Index is out of range")
            return grid[(row * cols) + col]
        }
        set{
            assert(isValidRowAndColumn(row: row, col: col), "Index is out of range")
            print("[ROW,COL] = \([row,col]) = \(newValue) ")
            grid[(row * cols) + col] = newValue
        }
    }

    fileprivate func isValidRowAndColumn(row: Int, col: Int) -> Bool {
        return (row > -1 && row < rows) && (col > -1 && col < cols)
    }
}
