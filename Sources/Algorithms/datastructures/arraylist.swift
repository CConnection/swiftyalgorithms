//
// Created by Thomas Kunze on 30.04.20.
// Copyright (c) 2020 Thomas Kunze. All rights reserved.
//

import Foundation

protocol Dictionary {
    func search(number: Int) -> [Int]
    mutating func insert(number: Int)
    mutating func delete(at index: Int) throws
    func min() -> Int?
    func max() -> Int?
    func predecessor(of number: Int) -> [Int]
    func successor(of number: Int) -> [Int]
}

enum UnorderedArrayListError: Error {
    case OutOfBound
}

struct UnorderedArrayList: Dictionary {
    var data: [Int]
    var lastIndex: Int

    init() {
        data = []
        lastIndex = -1
    }

    init(array: [Int]) {
        data = array
        lastIndex = data.count - 1
    }

    subscript(index: Int) -> Int { data[index] }

    // O(n) amortized as the copies always includes halfs, see skienna
    private mutating func grow() {
        for _ in 0..<data.count {
            data.append(0)
        }
    }

    // O(n) amortized as the copies always includes halfs, see skienna
    private mutating func shrink() {
        // TODO: Implement shrinking function
    }

    // O(n)
    func search(number: Int) -> [Int] {
        var result: [Int] = []

        if lastIndex >= 0 {
            for index in 0...lastIndex {
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
            lastIndex = 0
        } else {
            if lastIndex == data.count - 1 {
                grow()
            }

            lastIndex += 1
            data[lastIndex] = number
        }
    }

    // O(1)
    mutating func delete(at index: Int) throws {
        // TODO: Test it's usage
        guard index <= lastIndex else {
            throw UnorderedArrayListError.OutOfBound
        }

        if lastIndex != 0 && index != lastIndex {
            data[index] = data[lastIndex]
        }

        lastIndex -= 1
    }

    // O(3n)
    func predecessor(of number: Int) -> [Int] {
        let number = data[number]
        var currentPredecessor = 0

        var notFound = true
        for index in 0...lastIndex {
            if data[index] < number {
                currentPredecessor = data[index]
                notFound = false
                break
            }
        }

        if notFound {
            return []
        }

        for index in 0...lastIndex {
            if data[index] < number && data[index] > currentPredecessor {
                currentPredecessor = data[index]
            }
        }

        var result: [Int] = []
        for index in 0...lastIndex {
            if data[index] == currentPredecessor {
                result.append(index)
            }
        }
        return result
    }

    func successor(of number: Int) -> [Int] {
        let number = data[number]
        var currentSuccessor = 0

        var notFound = true
        for index in 0...lastIndex {
            if data[index] > number {
                currentSuccessor = data[index]
                notFound = false
                break
            }
        }

        if notFound {
            return []
        }

        for index in 0...lastIndex {
            if data[index] > number && data[index] < currentSuccessor {
                currentSuccessor = data[index]
            }
        }

        var result: [Int] = []
        for index in 0...lastIndex {
            if data[index] == currentSuccessor {
                result.append(index)
            }
        }
        return result
    }

    func min() -> Int? {
        guard lastIndex != -1 else {
            return nil
        }

        var minimum = data[0]
        for index in 0...lastIndex {
            if data[index] < minimum {
                minimum = data[index]
            }
        }

        return minimum
    }

    func max() -> Int? {
        guard lastIndex != -1 else {
            return nil
        }

        var maximum = data[0]
        for index in 0...lastIndex {
            if data[index] > maximum {
                maximum = data[index]
            }
        }

        return maximum
    }
}

struct OrderedArrayList {
    var data: [Int]
    var lastIndex: Int

    init() {
        data = []
        lastIndex = -1
    }

    init(array: [Int]) {
        data = array
        lastIndex = data.count - 1
    }

    subscript(index: Int) -> Int { data[index] }

    // O(n) amortized as the copies always includes halfs, see skienna
    private mutating func grow() {
        for _ in 0..<data.count {
            data.append(0)
        }
    }

    // O(n) amortized as the copies always includes halfs, see skienna
    private mutating func shrink() {
        // TODO: Implement shrinking function
    }

    func search(number: Int) -> [Int] {
        var result: [Int] = []

        if lastIndex >= 0 {
            for index in 0...lastIndex {
                if data[index] == number {
                    result.append(index)
                }
            }
        }

        return result
    }

    mutating func insert(number: Int) {
        if lastIndex == -1 {
            data.append(number)
            lastIndex += 1
        } else {
            if lastIndex == data.count - 1 {
                grow()
            }

            var temp = 0
            for index in 0...lastIndex {
                if number > data[index] {
                    temp = index + 1
                } else {
                    break
                }
            }
            if temp <= lastIndex  {
                for index in (temp...lastIndex).reversed() {
                    data[index + 1] = data[index]
                }
            }

            data[temp] = number
            lastIndex += 1
        }
    }
    mutating func delete(at index: Int) throws {}
    func min() -> Int? {
        guard lastIndex != -1 else {
            return nil
        }

        return data[0]
    }
    func max() -> Int? {
        guard lastIndex != -1 else {
            return nil
        }

        return data[lastIndex]
    }
    func predecessor(of number: Int) -> [Int] { return []}
    func successor(of number: Int) -> [Int] { return []}
}