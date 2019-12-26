//
//  01Knapsack.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 26/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//  https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/

import Foundation

class Knapsack {

    private var output: (maxValue: Int, weights: [Int]) = (0,[])

    var totalCapacity: Int
    var matrix: Matrix<Int>
    var weights: [Int], values: [Int]
    var rows: Int {
        return self.weights.count
    }

    var columns: Int {
        return totalCapacity + 1
    }

    init(knapsack: Int, weights: [Int], values: [Int]) {
        self.totalCapacity = knapsack
        self.weights = weights
        self.values = values
        self.matrix = Matrix<Int>(rows: weights.count + 1, column: totalCapacity + 1)
    }

    // bottom-up approach - DP
    func solveKnapsack() -> (maxValue: Int, weights: [Int]) {
        // iterate row
        for i in 0...self.rows {
            // iterate colum
            let curWeight = (i == 0) ? 0 : self.weights[i - 1]
            let curValue = (i == 0) ? 0 : self.values[i - 1]
            for j in 0...self.totalCapacity {
                // your current capacity = index of column
                let currCap = j
                if i == 0 { //we dont have sub problem
                    if curWeight < currCap {
                        // we are using current weight to fill  capacity
                          matrix[i, j]  = curValue
                    }
                } else { // we have sub problem
                    if curWeight > currCap {
                        // we cant fit the weight hence take previous sub problem
                         matrix[i, j]  = matrix[i - 1, j]
                    } else {
                        // we can take current weight and also the previous sub-problem
                        // all thing has to comare
                        // max {T[i-][j], Vi + T[i -1][j - Wi]}
                        let prevSub = matrix[i - 1, j]
                        let value = curValue + matrix[i - 1,  currCap - curWeight]
                        if prevSub > value {
                            self.matrix[i,j] = prevSub
                        } else {
                            self.matrix[i,j] = value
                        }
                    }
                }
            }
        }
        backtrack()
        return output
    }

    private func backtrack() {
        var remainingWeight = columns - 1
        var i = rows
        var j = columns - 1
        self.output.maxValue = self.matrix[i, j]
        while remainingWeight > 0 && i > 0 {
            if self.matrix[i - 1, j] < self.matrix[i, j] {
                self.output.weights.append(self.weights[ i - 1])
                 remainingWeight -= self.weights[ i - 1]
                 j = remainingWeight
            }
            i -= 1
        }
    }
}
