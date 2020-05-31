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
        }
    }
}