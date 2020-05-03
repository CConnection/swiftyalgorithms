//
// Created by Thomas Kunze on 30.04.20.
// Copyright (c) 2020 Thomas Kunze. All rights reserved.
//

import Quick
import Nimble
@testable import Algorithms

class MyArrayTests: QuickSpec {
    override func spec() {
        describe("the unsorted array datastructure") {
            context("when the array is empty") {
                it("inserts an element into the unsorted array") {
                    let expected = 5
                    var uArray = MyUnsortedArray()

                    uArray.insert(number: expected)

                    expect(uArray[0]).to(be(expected))
                }

                it("it returns an empty array if number is searched on array") {
                    var uArray = MyUnsortedArray()

                    let actual = uArray.search(number: 0)

                    expect(actual).to(beEmpty())
                }

                it("returns an empty array on delete") { 
                    var uArray = MyUnsortedArray()

                    uArray.delete(index: 0)

                    expect(uArray.lastNumber).to(be(-1))
                }
            }

            context("the array is not empty") {
                describe("looking for predecessor") {
                    context("when predecessor in array is placed before given number") {
                        it("returns the predecessor") {
                            let expected = [0]
                            var uArray = MyUnsortedArray(array: [1,0,5])
                            let actual = uArray.predecessor(ofIndex: 2)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when predecessor in array is placed after given number") {
                        it("returns the predecessor") {
                            let expected = [2]
                            var uArray = MyUnsortedArray(array: [5,0,1])
                            let actual = uArray.predecessor(ofIndex: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when multiple predecessors exist in array") {
                        it("returns the predecessors") {
                            let expected = [2,3]
                            var uArray = MyUnsortedArray(array: [5,0,1,1])
                            let actual = uArray.predecessor(ofIndex: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when predecessor does not exist") {
                        it("returns empty array") {
                            let expected: [Int] = []
                            var uArray = MyUnsortedArray(array: [5])
                            let actual = uArray.predecessor(ofIndex: 0)

                            expect(actual).to(be(expected))
                        }
                    }
                }

                describe("looking for successor") {
                    context("when successor in array is placed before given number") {
                        it("returns the successor") {
                            let expected = [0]
                            var uArray = MyUnsortedArray(array: [5,6,1])
                            let actual = uArray.successor(ofIndex: 2)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when successor in array is placed after given number") {
                        it("returns the successor") {
                            let expected = [2]
                            var uArray = MyUnsortedArray(array: [0,7,5])
                            let actual = uArray.successor(ofIndex: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when multiple successors exist in array") {
                        it("returns the successors") {
                            let expected = [2,3]
                            var uArray = MyUnsortedArray(array: [5,0,1,1])
                            let actual = uArray.successor(ofIndex: 1)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when successor does not exist") {
                        it("returns empty array") {
                            let expected: [Int] = []
                            var uArray = MyUnsortedArray(array: [5])
                            let actual = uArray.successor(ofIndex: 0)

                            expect(actual).to(be(expected))
                        }
                    }
                }

                describe("looking for minimum") {
                    context("when only one minimum exists in array") {
                        it("returns the minimum of an array") {
                            let expected = [1]
                            var uArray = MyUnsortedArray(array: [5,0,1])
                            let actual = uArray.min()

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when multiple minimum exist in array") {
                        it("returns the minimum of an array") {
                            let expected = [1,2]
                            var uArray = MyUnsortedArray(array: [5,1,1])
                            let actual = uArray.min()

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }

                describe("looking for maximum") {
                    context("when only one maximum exists in array") {
                        it("returns the minimum of an array") {
                            let expected = [0]
                            var uArray = MyUnsortedArray(array: [5,0,1])
                            let actual = uArray.max()

                            expect(actual).to(elementsEqual(expected))
                        }
                    }

                    context("when multiple minimum exist in array") {
                        it("returns the minimum of an array") {
                            let expected = [0,1]
                            var uArray = MyUnsortedArray(array: [5,5,1])
                            let actual = uArray.max()

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }

                it("inserts an element into the unsorted array") {
                    let expected = 5
                    var uArray = MyUnsortedArray(array: [0])

                    uArray.insert(number: expected)

                    expect(uArray[1]).to(be(expected))
                }

                it("returns the same size if index is larger than array on delete") {
                    var uArray = MyUnsortedArray(array: [0])
                    let expected = uArray.lastNumber

                    uArray.delete(index: 1)

                    expect(uArray.lastNumber).to(be(expected))
                }

                context("element is once in the array") {
                    it("it returns one index of the element") {
                        let expected = [0]
                        let uArray = MyUnsortedArray(array: [0])

                        let actual = uArray.search(number: 0)

                        expect(actual).to(elementsEqual(expected))
                    }

                    it("returns empty array after deleted from array") {
                        var uArray = MyUnsortedArray(array: [0])
                        let expected = uArray.lastNumber - 1

                        uArray.delete(index: 0)

                        expect(uArray.lastNumber).to(be(expected))
                    }

                    it("returns empty array when searched after deleted from array") {
                        var uArray = MyUnsortedArray(array: [0])

                        uArray.delete(index: 0)
                        var actual = uArray.search(number: 0)

                        expect(actual).to(beEmpty())
                    }
                }

                context("element is multiple times in the array") {
                    it("it returns both indices of the searched element") {
                        let expected = [0, 1]
                        let uArray = MyUnsortedArray(array: [0, 0])

                        let actual = uArray.search(number: 0)

                        expect(actual).to(elementsEqual(expected))
                    }
                }
            }
        }

        describe("the sorted array datastructure") { 
            it("inserts an element into the unsorted array") { 

            }
        }
    }
}