//
//  multiplication.spec.swift
//  Test all multiplication algorithms
//
//  Created by Thomas Kunze on 13.04.20.
//  Copyright © 2020 Thomas Kunze. All rights reserved.
//

import Quick
import Nimble
@testable import Algorithms

class MultiplicationTests: QuickSpec {
    override func spec() {
        describe("multiplying two numbers") {
            context("when the numbers are small") {
                it("returns the multiplication of both numbers") {
                    let x = [2]
                    let y = [2]
                    let expectedResult = [4]

                    let result = schoolMultiply(x: x, y: y)

                    expect(result).to(elementsEqual(expectedResult))
                }

                it(" returns a number with more digits than the two numbers themselves") {
                    let x = [1, 0]
                    let y = [2, 0]
                    let expectedResult = [2, 0, 0]

                    let result = schoolMultiply(x: x, y: y)

                    expect(result).to(elementsEqual(expectedResult))
                }
            }

            context("when the numbers are medium size") {
                it("returns the multiplication of both numbers") {
                    let x = [1, 0, 4, 8, 1, 3, 5]
                    let y = [8, 2, 3, 1, 1, 3]
                    let expectedResult = [8, 6, 2, 7, 3, 3, 5, 4, 4, 2, 5, 5]

                    let result = schoolMultiply(x: x, y: y)

                    expect(result).to(elementsEqual(expectedResult))
                }
            }

            context("when the numbers big size which normally would overflow with integer type") {
                it("returns the multiplication of both numbers") {
                    let x = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9, 3, 2, 3, 8, 4, 6, 2, 6, 4, 3, 3, 8, 3, 2, 7, 9, 5, 0, 2, 8, 8, 4, 1, 9, 7, 1, 6, 9, 3, 9, 9, 3, 7, 5, 1, 0, 5, 8, 2, 0, 9, 7, 4, 9, 4, 4, 5, 9, 2]
                    let y = [2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4, 5, 9, 0, 4, 5, 2, 3, 5, 3, 6, 0, 2, 8, 7, 4, 7, 1, 3, 5, 2, 6, 6, 2, 4, 9, 7, 7, 5, 7, 2, 4, 7, 0, 9, 3, 6, 9, 9, 9, 5, 9, 5, 7, 4, 9, 6, 6, 9, 6, 7, 6, 2, 7]
                    let expectedResult = [8, 5, 3, 9, 7, 3, 4, 2, 2, 2, 6, 7, 3, 5, 6, 7, 0, 6, 5, 4, 6, 3, 5, 5, 0, 8, 6, 9, 5, 4, 6, 5, 7, 4, 4, 9, 5, 0, 3, 4, 8, 8, 8, 5, 3, 5, 7, 6, 5, 1, 1, 4, 9, 6, 1, 8, 7, 9, 6, 0, 1, 1, 2, 7, 0, 6, 7, 7, 4, 3, 0, 4, 4, 8, 9, 3, 2, 0, 4, 8, 4, 8, 6, 1, 7, 8, 7, 5, 0, 7, 2, 2, 1, 6, 2, 4, 9, 0, 7, 3, 0, 1, 3, 3, 7, 4, 8, 9, 5, 8, 7, 1, 9, 5, 2, 8, 0, 6, 5, 8, 2, 7, 2, 3, 1, 8, 4]

                    let result = schoolMultiply(x: x, y: y)

                    expect(result).to(elementsEqual(expectedResult))
                }
            }
        }
    }
}
