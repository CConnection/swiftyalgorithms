//
// Created by Thomas Kunze on 07.05.20.
//

import Quick
import Nimble
@testable import Algorithms

class LinkedListsTests: QuickSpec {
    override func spec() {
        describe("Unordered single linked list") { 
            context("when creating new linked list") {
                context("when initialize empty list") { 
                    it("returns empty head") {
                        let list = UnorderedSingleLinkedList()
                        expect(list.head).to(beNil())
                    }
                }

                context("when initialize with values") {
                    context("when initialize with one value"){
                        it("returns non nil head") {
                            let list = UnorderedSingleLinkedList(withNumbers: [1])
                            expect(list.head).toNot(beNil())
                        }

                        it("returns given value at head") { 
                            let list = UnorderedSingleLinkedList(withNumbers:[1])
                            expect(list.head?.number).to(be(1))
                        }
                    }
                    context("when initialize with multiple values"){
                        it("returns given value at head") {
                            let list = UnorderedSingleLinkedList(withNumbers:[1, 2, 3])
                            expect(list.head?.number).to(be(1))
                            expect(list.head?.next?.number).to(be(2))
                            expect(list.head?.next?.next?.number).to(be(3))
                        }
                    }
                }
            }

            context("when searching for a node with value") { 
                context("when value is in list") { 
                    it("returns the node with the value"){
                        let expected = 2
                        let list = UnorderedSingleLinkedList(withNumbers: [1,2,3])
                        let result = list.search(number: expected)

                        expect(result?.number).to(be(expected))
                    }
                }

                context("when value is not in list") {
                    it("returns nil"){
                        let list = UnorderedSingleLinkedList(withNumbers: [1,2,3])
                        let result = list.search(number: 4)

                        expect(result?.number).to(beNil())
                    }
                }
            }

            context("when inserting a number into list") {
                context("when list is empty") { 
                    it("returns head with inserted value") {
                        let expected = 1
                        var list = UnorderedSingleLinkedList()
                        list.insert(number: expected)

                        expect(list.head?.number).to(be(expected))
                    }
                }

                context("when list is not empty") { 
                    it("returns the whole list with the element as head") {
                        let expected = 1
                        var list = UnorderedSingleLinkedList(withNumbers: [2,3])
                        list.insert(number: expected)

                        expect(list.head?.number).to(be(1))
                        expect(list.head?.next?.number).to(be(2))
                        expect(list.head?.next?.next?.number).to(be(3))
                    }
                }
            }

            context("when deleting a node from list") {
                context("when node is head") {
                    context("when head has successor") { 
                        it("returns successor has head") { 
                            let expected = 2
                            var list = UnorderedSingleLinkedList(withNumbers: [1,expected])
                            var node = list.head!
                            list.delete(node: node)

                            expect(list.head?.number).to(be(expected))
                        }
                    }
                    context("when head has no successor") { 
                        it("returns null as head") {
                            var list = UnorderedSingleLinkedList(withNumbers: [2])
                            let node = list.head!
                            expect(node).toNot(beNil())
                            list.delete(node: node)

                            expect(list.head).to(beNil())
                        }
                    }
                }
                context("when node is not head") { 
                    context("when node has successor") {
                        it("its has its successor at it's place") {
                            let expected = 3
                            var list = UnorderedSingleLinkedList(withNumbers: [1, 2, expected])
                            let node = list.search(number: 2)
                            list.delete(node: node!)

                            expect(list.head?.next?.number).to(be(expected))
                        }
                    }
                    context("when node has no successor") {
                        it("it has nil at it's place") {
                            var list = UnorderedSingleLinkedList(withNumbers:[1,2])
                            let node = list.search(number: 2)
                            list.delete(node: node!)

                            expect(list.head?.next).to(beNil())
                        }
                    }
                }
            }

            context("when searching for node with minimum value") { 
                context("when list is empty") { 
                    it("returns nil") { 
                        let list = UnorderedSingleLinkedList()
                        expect(list.min()).to(beNil())
                    }
                }

                context("when list is not empty") { 
                    it("returns the minimum value") {
                        let expected = 1
                        let list = UnorderedSingleLinkedList(withNumbers:[expected, 2, 3])
                        let minimum = list.min()

                        expect(minimum).to(be(expected))
                    }
                }
            }

            context("when searching for node with maximum value") {
                context("when list is empty") {
                    it("returns nil") {
                        let list = UnorderedSingleLinkedList()
                        expect(list.max()).to(beNil())
                    }
                }

                context("when list is not empty") {
                    it("returns the maximum value") {
                        let expected = 3
                        let list = UnorderedSingleLinkedList(withNumbers:[1, 2, expected])
                        let maximum = list.max()

                        expect(maximum).to(be(expected))
                    }
                }
            }

            context("when looking for predecessor node") {
                context("when list has one element") {
                    it("returns nil"){
                        let list = UnorderedSingleLinkedList(withNumbers: [1])
                        expect(list.predecessor(node: list.head!)).to(beNil())
                    }
                }

                context("when list has more than one element") { 
                    context("when node is min element") {
                        let list = UnorderedSingleLinkedList(withNumbers: [1,2])
                        let predecessorNode = list.predecessor(node: list.head!)

                        expect(predecessorNode).to(beNil())
                    }
                    context("when node is not min element") {
                        it("returns predecessor node") {
                            let expected = 1
                            let list = UnorderedSingleLinkedList(withNumbers: [3, expected,2])

                            let predecessorNode = list.predecessor(node: list.head!.next!.next!)

                            expect(predecessorNode?.number).to(be(expected))
                        }
                    }
                }
            }

            context("when looking for successor node") {
                context("when list has one element") {
                    it("returns nil"){
                        let list = UnorderedSingleLinkedList(withNumbers: [1])
                        expect(list.successor(node: list.head!)).to(beNil())
                    }
                }

                context("when list has more than one element") {
                    context("when node is max element") {
                        it("returns nil") {
                            let list = UnorderedSingleLinkedList(withNumbers: [1,2])
                            let successorNode = list.successor(node: list.head!.next!)

                            expect(successorNode).to(beNil())
                        }
                    }
                    context("when node is not max element") {
                        it("returns successor node") {
                            let expected = 2
                            let list = UnorderedSingleLinkedList(withNumbers: [1,3, expected])

                            let successorNode = list.successor(node: list.head!)

                            expect(successorNode?.number).to(be(expected))
                        }
                    }
                }
            }
        }
    }
}