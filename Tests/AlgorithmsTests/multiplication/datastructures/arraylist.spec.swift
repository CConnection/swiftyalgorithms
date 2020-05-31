//
// Created by Thomas Kunze on 30.04.20.
// Copyright (c) 2020 Thomas Kunze. All rights reserved.
//

import Quick
import Nimble
@testable import Algorithms

class ArrayListTests: QuickSpec {
    override func spec() {
        describe("Given an unordered array list") {
            context("when creating an array list") { 
                context("when creating an empty array") { 
                    it("has an empty data array") {
                        let arr = UnorderedArrayList()

                        expect(arr.data).to(beEmpty())
                    }
                }
                context("when creating an array with values") {
                    it("has returns an data array with the given elements") {
                        let expected = [0, 1]
                        let arr = UnorderedArrayList(array: expected)
                        expect(arr.data).to(elementsEqual(expected))
                    }
                }
            }
            context("when searching for an element") { 
                context("when array is empty") {
                    it("it returns an empty array if number is searched on array") {
                        let arr = UnorderedArrayList()

                        let actual = arr.search(number: 0)

                        expect(actual).to(beEmpty())
                    }
                }
                context("when array is not empty") { 
                    context("when element is once in array") {
                        it("returns one index of the element") {
                            let expected = [0]
                            let arr = UnorderedArrayList(array: [0])

                            let actual = arr.search(number: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                    context("when element is multiple times in the array") {
                        it("returns both indices of the searched element") {
                            let expected = [0, 1]
                            let arr = UnorderedArrayList(array: [0, 0])

                            let actual = arr.search(number: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }
            }

            context("when inserting an element") {
                context("when array is empty") {
                    it("inserts an element into the unordered array") {
                        let expected = 5
                        var arr = UnorderedArrayList()

                        arr.insert(number: expected)

                        expect(arr[0]).to(be(expected))
                    }
                }
                context("when array is not empty") {
                    it("inserts an element into the unordered array") {
                        let expected = 5
                        var arr = UnorderedArrayList(array: [0])

                        arr.insert(number: expected)

                        expect(arr[1]).to(be(expected))
                    }
                }
            }

            context("when deleting an item") {
                context("when given index is out of bound") {
                    it("throws a out of bound error") {
                        var arr = UnorderedArrayList()
                        expect {try arr.delete(at: 0)}.to(throwError(UnorderedArrayListError.OutOfBound))
                    }
                }

                context("when array is not empty") {
                    it("contains all remaining elements") {
                        let expected = [3,1,7,0]
                        var arr = UnorderedArrayList(array: [0,7,3,4,1])

                        try? arr.delete(at: 3)

                        expect(arr.data).to(contain(expected))
                    }

                    context("when array is empty after deletion") {
                        it("returns empty array when searched after deleted from array") {
                            var arr = UnorderedArrayList(array: [0])

                            try? arr.delete(at: 0)
                            let actual = arr.search(number: 0)

                            expect(actual).to(beEmpty())
                        }
                    }
                }
            }

            context("when looking for minimum") {
                context("when array is empty") {
                    it("returns an empty array") {
                        let arr = UnorderedArrayList()
                        let actual = arr.min()

                        expect(actual).to(beNil())
                    }
                }
                context("when array is not empty") {
                    context("when element is once in array") {
                        it("returns the minimum of an array") {
                            let expected = 0
                            let arr = UnorderedArrayList(array: [5, 0, 1])
                            let actual = arr.min()

                            expect(actual).to(be(expected))
                        }
                    }
                    context("when element is multiple times in the array") {
                        it("returns the minimum of an array") {
                            let expected = 1
                            let arr = UnorderedArrayList(array: [5,1,1])
                            let actual = arr.min()

                            expect(actual).to(be(expected))
                        }
                    }
                }
            }

            context("when looking for maximum") {
                context("when array is empty") {
                    it("returns an empty array") {
                        let arr = UnorderedArrayList()
                        let actual = arr.max()

                        expect(actual).to(beNil())
                    }
                }
                context("when array is not empty") {
                    context("when maximum is once in array") {
                        it("returns the maximum of an array") {
                            let expected = 5
                            let arr = UnorderedArrayList(array: [5,0,1])
                            let actual = arr.max()

                            expect(actual).to(be(expected))
                        }
                    }
                    context("when maximum is multiple times in the array") {
                        it("returns the maximum of an array") {
                            let expected = 5
                            let arr = UnorderedArrayList(array: [5,5,1])
                            let actual = arr.max()

                            expect(actual).to(be(expected))
                        }
                    }
                }
            }

            context("when searching for predecessor of an element") {
                context("when array is empty") {
                    it("returns empty array") {
                        let expected: [Int] = []
                        let arr = UnorderedArrayList(array: [5])
                        let actual = arr.predecessor(of: 0)

                        expect(actual).to(be(expected))
                    }
                }
                context("when array is not empty") {
                    context("when predecessor is once in array") {
                        context("when predecessor in array is placed before given number") {
                            it("returns the predecessor") {
                                let expected = [0]
                                let arr = UnorderedArrayList(array: [1,0,5])
                                let actual = arr.predecessor(of: 2)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }

                        context("when predecessor in array is placed after given number") {
                            it("returns the predecessor") {
                                let expected = [2]
                                let arr = UnorderedArrayList(array: [5,0,1])
                                let actual = arr.predecessor(of: 0)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }

                    }
                    context("when multiple predecessor exist in the array") {
                        it("returns the predecessors") {
                            let expected = [2,3]
                            let arr = UnorderedArrayList(array: [5,0,1,1])
                            let actual = arr.predecessor(of: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }
            }

            context("when searching for successor of an element") {
                context("when array is empty") {
                    it("returns empty array") {
                        let expected: [Int] = []
                        let arr = UnorderedArrayList(array: [5])
                        let actual = arr.successor(of: 0)

                        expect(actual).to(be(expected))
                    }
                }
                context("when array is not empty") {
                    context("when successor is once in array") {
                        context("when successor in array is placed before given number") {
                            it("returns the successor") {
                                let expected = [0]
                                let arr = UnorderedArrayList(array: [5,6,1])
                                let actual = arr.successor(of: 2)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }

                        context("when successor in array is placed after given number") {
                            it("returns the successor") {
                                let expected = [2]
                                let arr = UnorderedArrayList(array: [0,7,5])
                                let actual = arr.successor(of: 0)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }
                    }
                    context("when multiple successor exist in the array") {
                        it("returns the successors") {
                            let expected = [2,3]
                            let arr = UnorderedArrayList(array: [5,0,1,1])
                            let actual = arr.successor(of: 1)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }
            }
        }

        describe("Given an ordered array list") {
            context("when creating an array list") {
                context("when creating an empty array") {
                    it("has an empty data array") {
                        let arr = OrderedArrayList()

                        expect(arr.data).to(beEmpty())
                    }
                }
                context("when creating an array with values") {
                    it("has returns an data array with the given elements") {
                        let expected = [0, 1]
                        let arr = OrderedArrayList(array: expected)
                        expect(arr.data).to(elementsEqual(expected))
                    }
                }
            }
            context("when searching for an element") {
                context("when array is empty") {
                    it("it returns an empty array if number is searched on array") {
                        let arr = OrderedArrayList()

                        let actual = arr.search(number: 0)

                        expect(actual).to(beEmpty())
                    }
                }
                context("when array is not empty") {
                    context("when element is once in array") {
                        it("returns one index of the element") {
                            let expected = [0]
                            let arr = OrderedArrayList(array: [0])

                            let actual = arr.search(number: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                    context("when element is multiple times in the array") {
                        it("returns both indices of the searched element") {
                            let expected = [0, 1]
                            let arr = OrderedArrayList(array: [0, 0])

                            let actual = arr.search(number: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }
            }

            context("when inserting an element") {
                context("when array is empty") {
                    it("inserts an element") {
                        let expected = 5
                        var arr = OrderedArrayList()

                        arr.insert(number: expected)

                        expect(arr[0]).to(be(expected))
                    }
                }
                context("when array is not empty") {
                    context("when element will be inserted at the beginning") {
                        it("inserts an element") {
                            let expected = [0,5]
                            var arr = OrderedArrayList(array: [5])

                            arr.insert(number: 0)

                            expect(arr.data).to(elementsEqual(expected))
                        }
                    }
                    context("when element will be inserted at the end") {
                        it("inserts an element") {
                            let expected = [0,5]
                            var arr = OrderedArrayList(array: [0])

                            arr.insert(number: 5)

                            expect(arr.data).to(elementsEqual(expected))
                        }
                    }
                    context("when element will be inserted at in between") {
                        it("inserts an element") {
                            let expected = [0,5,10]
                            var arr = OrderedArrayList(array: [0,10])

                            arr.insert(number: 5)

                            expect(arr.data).to(elementsEqual(expected))
                        }
                    }
                }
            }

            context("when deleting an item") {
                context("when given index is out of bound") {
                    it("throws a out of bound error") {
                        var arr = OrderedArrayList()
                        expect {try arr.delete(at: 0)}.to(throwError(OrderedArrayListError.OutOfBound))
                    }
                }

                context("when array is not empty") {
                    it("contains all remaining elements") {
                        let expected = [3,1,7,0]
                        var arr = OrderedArrayList(array: [0,7,3,4,1])

                        try? arr.delete(at: 3)

                        expect(arr.data).to(contain(expected))
                    }

                    context("when array is empty after deletion") {
                        it("returns empty array when searched after deleted from array") {
                            var arr = OrderedArrayList(array: [0])

                            try? arr.delete(at: 0)
                            let actual = arr.search(number: 0)

                            expect(actual).to(beEmpty())
                        }
                    }
                }
            }

            context("when looking for minimum") {
                context("when array is empty") {
                    it("returns an empty array") {
                        let arr = OrderedArrayList()
                        let actual = arr.min()

                        expect(actual).to(beNil())
                    }
                }
                context("when array is not empty") {
                    context("when element is once in array") {
                        it("returns the minimum of an array") {
                            let expected = 1
                            let arr = OrderedArrayList(array: [1, 3, 5])
                            let actual = arr.min()

                            expect(actual).to(be(expected))
                        }
                    }
                    context("when element is multiple times in the array") {
                        it("returns the minimum of an array") {
                            let expected = 1
                            let arr = OrderedArrayList(array: [1, 1, 5])
                            let actual = arr.min()

                            expect(actual).to(be(expected))
                        }
                    }
                }
            }

            context("when looking for maximum") {
                context("when array is empty") {
                    it("returns an empty array") {
                        let arr = OrderedArrayList()
                        let actual = arr.max()

                        expect(actual).to(beNil())
                    }
                }
                context("when array is not empty") {
                    context("when maximum is once in array") {
                        it("returns the maximum of an array") {
                            let expected = 5
                            let arr = OrderedArrayList(array: [0,1,5])
                            let actual = arr.max()

                            expect(actual).to(be(expected))
                        }
                    }
                    context("when maximum is multiple times in the array") {
                        it("returns the maximum of an array") {
                            let expected = 5
                            let arr = OrderedArrayList(array: [1,5,5])
                            let actual = arr.max()

                            expect(actual).to(be(expected))
                        }
                    }
                }
            }

            context("when searching for predecessor of an element") {
                context("when array is empty") {
                    it("returns empty array") {
                        let expected: [Int] = []
                        let arr = OrderedArrayList(array: [5])
                        let actual = arr.predecessor(of: 0)

                        expect(actual).to(be(expected))
                    }
                }
                context("when array is not empty") {
                    context("when predecessor is once in array") {
                        context("when predecessor in array is placed before given number") {
                            it("returns the predecessor") {
                                let expected = [0]
                                let arr = OrderedArrayList(array: [0,1,5])
                                let actual = arr.predecessor(of: 1)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }

                        context("when predecessor in array is placed after given number") {
                            it("returns the predecessor") {
                                let expected = [1]
                                let arr = OrderedArrayList(array: [0,1,5])
                                let actual = arr.predecessor(of: 5)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }

                    }
                    context("when multiple predecessor exist in the array") {
                        it("returns the predecessors") {
                            let expected = [2,1]
                            let arr = OrderedArrayList(array: [0,1,1,5])
                            let actual = arr.predecessor(of: 5)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }
            }

            context("when searching for successor of an element") {
                context("when array is empty") {
                    it("returns empty array") {
                        let expected: [Int] = []
                        let arr = OrderedArrayList(array: [5])
                        let actual = arr.successor(of: 0)

                        expect(actual).to(be(expected))
                    }
                }
                context("when array is not empty") {
                    context("when successor is once in array") {
                        context("when successor in array is placed before given number") {
                            it("returns the successor") {
                                let expected = [2]
                                let arr = OrderedArrayList(array: [1,5,6])
                                let actual = arr.successor(of: 5)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }

                        context("when successor in array is placed after given number") {
                            it("returns the successor") {
                                let expected = [1]
                                let arr = OrderedArrayList(array: [0,5,7])
                                let actual = arr.successor(of: 0)

                                expect(actual).to(elementsEqual(expected))
                            }
                        }
                    }
                    context("when multiple successor exist in the array") {
                        it("returns the successors") {
                            let expected = [1,2]
                            let arr = OrderedArrayList(array: [0,1,1,5])
                            let actual = arr.successor(of: 0)

                            expect(actual).to(elementsEqual(expected))
                        }
                    }
                }
            }
        }
    }
}