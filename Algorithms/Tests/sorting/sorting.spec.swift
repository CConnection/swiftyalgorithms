//
//  sorting.swift
//  Tests
//
//  Created by Thomas Kunze on 16.04.20.
//  Copyright © 2020 Thomas Kunze. All rights reserved.
//

import XCTest

class sorting: XCTestCase {
    func testMergeSort() throws {
        let unsorted = [3,6,4,5,1,7,9,8,2]
        let expected = [1,2,3,4,5,6,7,8,9]
        
        let result = mergeSort(arr: unsorted)
        
        XCTAssertEqual(result, expected)
    }
}
