//
//  DroppingEgg.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 27/12/19.
//  Copyright © 2019 Manish. All rights reserved.
// https://www.geeksforgeeks.org/egg-dropping-puzzle-dp-11/
// number of ways an experiment can be carried out with n eggs and f floors

import Foundation

class DroppingEgg {
    typealias Input = (eggs: Int,  floors: Int)
    typealias Output = (Int)

    private var input: Input
    private var output: Output

    private var matrix: Matrix<Int>!

    private var rows: Int {
        return self.input.floors + 1
    }

    private var coulmns: Int {
        return self.input.eggs + 1
    }

    init(data: Input) {
        self.input = data
        self.output = (0)
        self.matrix = Matrix<Int>(rows: rows, column: coulmns)
    }

}


extension DroppingEgg {
    func solveEggdropping() -> Output {
        return output
    }
}
