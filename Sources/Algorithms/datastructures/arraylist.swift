//
// Created by Thomas Kunze on 30.04.20.
// Copyright (c) 2020 Thomas Kunze. All rights reserved.
//

import Foundation

protocol ArrayDictionary {
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

struct UnorderedArrayList: ArrayDictionary {
    var data: [Int]

    init() {
        data = []
    }

    init(array: [Int]) {
        data = array
    }

    subscript(index: Int) -> Int { data[index] }

    // O(n)
    func search(number: Int) -> [Int] {
        var result: [Int] = []

        if data.count > 0 {
            for (index, value) in data.enumerated() {
                if value == number {
                    result.append(index)
                }
            }
        }

        return result
    }

    // O(1)
    mutating func insert(number: Int) {
        data.append(number)
    }

    // O(1)
    mutating func delete(at index: Int) throws {
        guard index >= 0 && index < data.count else {
            throw UnorderedArrayListError.OutOfBound
        }

        if index != data.startIndex && index != data.endIndex {
            if let last = data.last {
                data[index] = last
            }
        }

        data.removeLast()
    }

    // O(3n)
    func predecessor(of number: Int) -> [Int] {
        let number = data[number]
        var currentPredecessor = 0

        var notFound = true
        for value in data {
            if value < number {
                currentPredecessor = value
                notFound = false
                break
            }
        }

        if notFound {
            return []
        }

        for value in data {
            if value < number && value > currentPredecessor {
                currentPredecessor = value
            }
        }

        var result: [Int] = []
        for (index, value) in data.enumerated() {
            if value == currentPredecessor {
                result.append(index)
            }
        }
        return result
    }

    func successor(of number: Int) -> [Int] {
        let number = data[number]
        var currentSuccessor = 0

        var notFound = true
        for value in data {
            if value > number {
                currentSuccessor = value
                notFound = false
                break
            }
        }

        if notFound {
            return []
        }

        for value in data {
            if value > number && value < currentSuccessor {
                currentSuccessor = value
            }
        }

        var result: [Int] = []
        for (index, value) in data.enumerated() {
            if value == currentSuccessor {
                result.append(index)
            }
        }
        return result
    }

    func min() -> Int? {
        guard data.count != 0 else {
            return nil
        }

        var minimum = data[0]
        for value in data {
            if value < minimum {
                minimum = value
            }
        }

        return minimum
    }

    func max() -> Int? {
        guard data.count != 0 else {
            return nil
        }

        var maximum = data[0]
        for value in data {
            if value > maximum {
                maximum = value
            }
        }

        return maximum
    }
}

enum OrderedArrayListError: Error {
    case OutOfBound
}


struct OrderedArrayList: ArrayDictionary {
    var data: [Int]

    init() {
        data = []
    }

    init(array: [Int]) {
        data = array
    }

    subscript(index: Int) -> Int { data[index] }

    func search(number: Int) -> [Int] {
        var result: [Int] = []

        if data.count > 0 {
            for (index, value) in data.enumerated() {
                if value == number {
                    result.append(index)
                }
            }
        }

        return result
    }

    mutating func insert(number: Int) {
        if data.count == 0 {
            data.append(number)
        } else {
            var temp = 0
            for (index, value) in data.enumerated() {
                if number > value {
                    temp = index + 1
                } else {
                    break
                }
            }

            data.insert(number, at: temp)
        }
    }

    mutating func delete(at index: Int) throws {
        guard index >= 0 && index < data.count else {
            throw OrderedArrayListError.OutOfBound
        }

        if index == data.startIndex {
            data.removeFirst()
        } else if index == data.endIndex {
            data.removeLast()
        } else {
            data.remove(at: index)
        }
    }

    func min() -> Int? {
        return data.first
    }

    func max() -> Int? {
        return data.last
    }

    func predecessor(of number: Int) -> [Int] {
        var result: [Int] = []

        let index = data.firstIndex(of: number)

        if let numberIndex = index, numberIndex > 0 {
            var predecessorIndex = numberIndex - 1
            let predecessorValue = data[predecessorIndex]
            
            repeat  {
                result.append(predecessorIndex)
                predecessorIndex -= 1
            } while predecessorIndex >= 0 && predecessorValue == data[predecessorIndex]
        }

        return result
    }
    func successor(of number: Int) -> [Int] {
        var result: [Int] = []

        let index = data.lastIndex(of: number)

        if let numberIndex = index, numberIndex < data.count - 1 {
            var successorIndex = numberIndex + 1
            let successorValue = data[successorIndex]

            repeat  {
                result.append(successorIndex)
                successorIndex += 1
            } while successorIndex <= data.count - 1 && successorValue == data[successorIndex]
        }

        return result
    }
}