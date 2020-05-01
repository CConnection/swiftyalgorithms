//
// Created by Thomas Kunze on 13.04.20.
// Copyright (c) 2020 Thomas Kunze. All rights reserved.
//

import Foundation

// O(n * logn), n for merge, logn recursive calls with merge
func mergeSort(arr: [Int]) -> [Int] {
    if (arr.count <= 1) {
        return arr
    }

    let lhs = mergeSort(arr: Array(arr[0..<arr.count/2]))
    let rhs = mergeSort(arr: Array(arr[arr.count/2..<arr.count]))
    return merge(left: lhs, right: rhs)
}

// O(n), iterarting through both arrays: 2n
func merge(left: [Int], right: [Int]) -> [Int] {
    let iterations = left.count + right.count
    var leftIndex = 0
    var rightIndex = 0
    var mergedArray: [Int] = []

    for _ in 0..<iterations {
        if leftIndex < left.count && rightIndex < right.count {
            if(left[leftIndex] < right[rightIndex]) {
                mergedArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                mergedArray.append(right[rightIndex])
                rightIndex += 1
            }
        } else if leftIndex < left.count {
            mergedArray.append(left[leftIndex])
            leftIndex += 1
        } else if rightIndex < right.count {
            mergedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    return mergedArray
}
