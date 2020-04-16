//
//  Addition.spec.swift
//  Test all addition algorithms
//
//  Created by Thomas Kunze on 13.04.20.
//  Copyright © 2020 Thomas Kunze. All rights reserved.
//
import XCTest


class AdditionTest: XCTestCase {
    func testSmall() throws {
        let x = [1, 0]
        let y = [2, 0]
        let expect = [3, 0]

        let result = schoolAddition(x: x, y: y)

        XCTAssertTrue(result.elementsEqual(expect))
    }

    func testSmallWithCarries() throws {
        let x = [9, 9]
        let y = [9, 9]
        let expect = [1, 9, 8]

        let result = schoolAddition(x: x, y: y)

        XCTAssertTrue(result.elementsEqual(expect))
    }

    func testBig() throws {
        let x = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9, 3, 2, 3, 8, 4, 6, 2, 6, 4, 3, 3, 8, 3, 2, 7, 9, 5, 0, 2, 8, 8, 4, 1, 9, 7, 1, 6, 9, 3, 9, 9, 3, 7, 5, 1, 0, 5, 8, 2, 0, 9, 7, 4, 9, 4, 4, 5, 9, 2]
        
        let y = [2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4, 5, 9, 0, 4, 5, 2, 3, 5, 3, 6, 0, 2, 8, 7, 4, 7, 1, 3, 5, 2, 6, 6, 2, 4, 9, 7, 7, 5, 7, 2, 4, 7, 0, 9, 3, 6, 9, 9, 9, 5, 9, 5, 7, 4, 9, 6, 6, 9, 6, 7, 6, 2, 7]
        
        let expect = [5, 8, 5, 9, 8, 7, 4, 4, 8, 2, 0, 4, 8, 8, 3, 8, 4, 7, 3, 8, 2, 2, 9, 3, 0, 8, 5, 4, 6, 3, 2, 1, 6, 5, 3, 8, 1, 9, 5, 4, 4, 1, 6, 4, 9, 3, 0, 7, 5, 0, 6, 5, 3, 9, 5, 9, 4, 1, 9, 1, 2, 2, 1, 9]

        let result = schoolAddition(x: x, y: y)

        print(result)
        XCTAssertTrue(result.elementsEqual(expect))
    }

}
