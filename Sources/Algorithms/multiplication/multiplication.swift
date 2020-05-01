//
// Created by Thomas Kunze on 13.04.20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

// O(Karatsuba, recursive algorithm) = O(n*logn)
/*func karatsubaMultiply(x: [Int], y: [Int]) -> [Int] {

    // if basecase: n = 1
        // if return x[0] * y[0]
    // else
        // split first array in a and b
        // split second array in c and d
        // compute the addition of  e = a+c and f = b+d
        // recursively call multiplication for a*c
        // recursively call multiplication for b*d
        // recursively call multiplication for e*f
        // compute  abcd = e*f - a*c - b*d
        // padding ac with 10^n zeros
        // padding abcd with 10^n/2 zeros
        // return padded ac + padded abcd + bd
    
    return [3, 0]
}*/

// O(n^2)
func schoolMultiply(x: [Int], y: [Int]) -> [Int] {
    var iterationResult: [[Int]] = Array(repeating: Array(repeating: 0, count: y.count), count: x.count)
    
    var carry = 0
    for digitX in (0...x.count - 1).reversed() {
        for digitY in (0...y.count - 1).reversed() {
            iterationResult[digitX][digitY] = (y[digitY] * x[digitX] + carry) % 10
            carry = (y[digitY] * x[digitX] + carry) / 10
        }
        
        if carry != 0 {
            iterationResult[digitX].insert(carry, at: 0)
            carry = 0
        }
        
        iterationResult[digitX].append(contentsOf: Array(repeating: 0, count:  (x.count - 1 - digitX)))
    }
    
    return iterationResult.reduce([0]) { (x, y) -> [Int] in
        return schoolAddition(x: x, y: y)
    }
}
