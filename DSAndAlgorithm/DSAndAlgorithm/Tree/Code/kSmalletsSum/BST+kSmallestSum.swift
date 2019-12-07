//
//  BST+kSmallestSum.swift
//  DSAndAlgorithm
//
//  Created by Manish Kumar on 07/12/19.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation


extension BinarySearchTree {
    func findKSmallestElementSum(_ k: Int) -> Int {
        var count = 0
        findKSmallestElementSum(self.root,k,&count)
        return self.sum
    }


    func findKSmallestElementSum(_ node: TreeNode?, _ k: Int, _  count: inout Int) {

        guard let validNode = node, count < k  else {
            return
        }

        findKSmallestElementSum(validNode.left, k, &count)
        count += 1
        self.sum += validNode.val
        findKSmallestElementSum(validNode.right, k, &count)

    }
}
