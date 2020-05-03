//
// Created by Thomas Kunze on 30.04.20.
// Copyright (c) 2020 Thomas Kunze. All rights reserved.
//

import Foundation

struct MyUnsortedArray {
    var data: [Int]
    var lastNumber: Int

    init() {
        data = []
        lastNumber = -1
    }

    init(array: [Int]) {
        data = array
        lastNumber = data.count - 1
    }

    subscript(index: Int) -> Int { data[index] }

    // O(n)
    func search(number: Int) -> [Int] {
        var result: [Int] = []

        if lastNumber >= 0 {
            for index in 0...lastNumber {
                if data[index] == number {
                    result.append(index)
                }
            }
        }

        return result
    }

    // O(1)
    mutating func insert(number: Int) {
        if data.count == 0 {
            data = Array(repeating: number, count: 1)
            lastNumber = 0
        } else {
             if lastNumber == data.count - 1 {
                 doubleArray()
             }

            lastNumber += 1
            data[lastNumber] = number
        }
    }

    // O(n) amortized as the copies always includes halfs, see skienna
    private mutating func doubleArray() {
        for _ in 0..<data.count {
            data.append(0)
        }
    }

    // O(1)
    mutating func delete(index: Int) {
        if index <= lastNumber {
            if lastNumber != 0 && index != lastNumber {
                data[index] = data[lastNumber]
            }

            lastNumber -= 1
        }
    }

    // O(3n)
    func predecessor(ofIndex: Int) -> [Int]? {
        guard ofIndex <= lastNumber && lastNumber >= 0 else {
            return nil
        }

        let number = data[ofIndex]
        var currentPredecessor = 0

        var notFound = true
        for index in 0...lastNumber {
            if data[index] < number {
                currentPredecessor = data[index]
                notFound = false
                break
            }
        }

        if notFound {
            return []
        }

        for index in 0...lastNumber {
            if data[index] < number && data[index] > currentPredecessor {
                currentPredecessor = data[index]
            }
        }

        var result: [Int] = []
        for index in 0...lastNumber {
            if data[index] == currentPredecessor {
                result.append(index)
            }
        }
        return result
    }

    func successor(ofIndex: Int) -> [Int]? {
        guard ofIndex <= lastNumber && lastNumber >= 0 else {
            return nil
        }

        let number = data[ofIndex]
        var currentSuccessor = 0

        var notFound = true
        for index in 0...lastNumber {
            if data[index] > number {
                currentSuccessor = data[index]
                notFound = false
                break
            }
        }

        if notFound {
            return []
        }

        for index in 0...lastNumber {
            if data[index] > number && data[index] < currentSuccessor {
                currentSuccessor = data[index]
            }
        }

        var result: [Int] = []
        for index in 0...lastNumber {
            if data[index] == currentSuccessor {
                result.append(index)
            }
        }
        return result
    }
    func min() -> [Int] {
        guard lastNumber != -1 else {
            return []
        }

        var minimum = data[0]
        for index in 0...lastNumber {
            if data[index] < minimum {
                minimum = data[index]
            }
        }

        var result: [Int] = []
        for index in 0...lastNumber {
            if data[index] == minimum {
                result.append(index)
            }
        }

        return result
    }
    func max() -> [Int] {
        guard lastNumber != -1 else {
            return []
        }

        var maximum = data[0]
        for index in 0...lastNumber {
            if data[index] > maximum {
                maximum = data[index]
            }
        }

        var result: [Int] = []
        for index in 0...lastNumber {
            if data[index] == maximum {
                result.append(index)
            }
        }
        return result
    }
}