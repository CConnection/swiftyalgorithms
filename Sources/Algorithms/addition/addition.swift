//
// Created by Thomas Kunze on 13.04.20.
// Copyright (c) 2020 Thomas Kunze. All rights reserved.
//

import Foundation

// O(n)
func schoolAddition(x: [Int], y: [Int]) -> [Int] {
    var lhs = x
    var rhs = y

    if lhs.count > rhs.count {
        let padding = Array(repeating: 0, count: lhs.count - rhs.count)
        rhs.insert(contentsOf: padding, at: 0)
    } else if rhs.count > lhs.count {
        let padding = Array(repeating: 0, count: rhs.count - lhs.count)
        lhs.insert(contentsOf: padding, at: 0)
    }

    var result = Array(repeating: 0, count: lhs.count)
    var carry = 0

    for index in (0...lhs.count - 1).reversed() {
        result[index] = (lhs[index] + rhs[index] + carry) % 10
        carry = (lhs[index] + rhs[index] + carry) / 10
    }
    
    if carry != 0 {
        result.insert(carry, at: 0)
    }

    return result
}
