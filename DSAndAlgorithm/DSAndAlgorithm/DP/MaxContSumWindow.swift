//
//  MaxSumSlidingWindow.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 05/01/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import Foundation

class MaxValueContSubsequence {
    var input: [Int]
    var output: Int

    var dp: [Int]

    init(data: [Int]) {
        self.input = data
        self.dp = Array(repeating: 0, count: data.count)
        self.output = -1
    }

    func solve() -> [Int] {
        dp[0] = input[0]
        for i in 1..<input.count {
            let prevVal = dp[i - 1]
            let curVal = input[i] + prevVal
            if curVal > input[i] {
                dp[i] = curVal
            } else {
                // this resetting the window here as  input[i] is greater than previous sum + input[i]
                // i.e input[i] cant be added to window
                // hence resetting the window
                dp[i] =  input[i]
            }
        }

        return dp
    }
}


class MaxSumWindowNotTwoContigous {
    var input: [Int]
    var output: Int

    var dp: [Int]

    init(data: [Int]) {
        self.input = data
        self.dp = Array(repeating: 0, count: data.count)
        self.output = -1
    }

    //we cant select two consequetive integers but we can select any two non consequetive integers
    func solve() -> [Int] {
        dp[0] = input[0]
        dp[1] = findMax(input[0], dp[0])
        for i in 2..<input.count {
            let prevVal = dp[i - 1]
            let curVal = dp[i - 2] + input[i]
            dp[i] = findMax(curVal, prevVal)
        }
        return dp
    }

    private func findMax(_ a: Int, _ b: Int) -> Int {
        return (a > b) ? a : b
    }
    
}
