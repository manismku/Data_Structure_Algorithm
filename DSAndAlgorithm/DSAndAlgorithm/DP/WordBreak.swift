//
//  WordBreak.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 29/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

class WordBreak {
    typealias Input = (str: String, dic: [String])
    typealias Output = ([String])

    // private stored property
    private var output: Output
    private var matrix: Matrix<Int>
    private var inputChars: [Character]
    private var inputDict: [String]

    // rows and columns
    private var rows: Int {
        return inputChars.count + 1
    }

    private var columns: Int {
        return inputChars.count + 1
    }

    // initializer
    init(data: Input) {
        self.inputChars = Array(data.str)
        self.inputDict = data.dic
        output = []
        self.matrix = Matrix<Int>(rows: inputChars.count + 1, column: inputChars.count + 1)
    }

    func backtrack() {

    }

}

extension WordBreak {

    func solveWordbreak() -> Output {

        for rowIndex in 1..<rows {
            for colIndex in 1..<columns {
                
            }
        }
        return output
    }

}
