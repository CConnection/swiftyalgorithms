//
// Created by Thomas Kunze on 30.04.20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct MyUnsortedArray {
    var data: [Int]
    var isSet: [Bool]
    var lastNumber: Int

    init() {
        data = Array(repeating: 0, count: 0)
        isSet = Array(repeating: false, count: 0)
        lastNumber = -1
    }

    func search(number: Int) -> Int {
        for (index, value) in data.enumerated() {
            if value == number {
                return index
            }
        }

        return -1
    }

    mutating func insert(number: Int) {
        if data.count == 0 {
            data = Array(repeating: number, count: 1)
            isSet = Array(repeating: true, count: 1)
            lastNumber = 0
        } else if lastNumber == data.count - 1 {
            doubleArray()
        } else {
            data[lastNumber + 1] = number
        }
    }

    func doubleArray() {}
    func delete(number: Int) {}
    func predecessor() -> Int {return 0}
    func successor() -> Int {return 0}
    func first() -> Int {return 0}
    func last() -> Int {return 0}
}