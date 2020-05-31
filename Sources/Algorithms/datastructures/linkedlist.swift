//
// Created by Thomas Kunze on 07.05.20.
//

import Foundation

class SingleLinkedNode {
    var number: Int
    var next: SingleLinkedNode?

    init(_ number: Int) {
        self.number = number
    }
}

protocol SingleLinkedList {
    func search(number: Int) -> SingleLinkedNode?
    mutating func insert(number: Int)
    func delete(node: SingleLinkedNode)
    func min() -> Int?
    func max() -> Int?
    func predecessor(node: SingleLinkedNode) -> SingleLinkedNode?
    func successor(node: SingleLinkedNode) -> SingleLinkedNode?
}

enum UnorderedSingleLinkedListError: Error {
    case InitWithNoNumbers
}

struct UnorderedSingleLinkedList: SingleLinkedList {
    var head: SingleLinkedNode?

    init() {
        self.head = nil
    }

    init(withNumbers numbers: [Int]) {
        guard numbers.count > 0 else { return }

        self.head = SingleLinkedNode(numbers[0])

        var count = 1
        var current = self.head!
        while count < numbers.count {
            current.next = SingleLinkedNode(numbers[count])
            current = current.next!
            count += 1
        }
    }

    func search(number: Int) -> SingleLinkedNode? {
        var result: SingleLinkedNode? = nil

        var current = self.head
        while current != nil {
            if(current?.number == number) {
                result = current
            }
            current = current?.next
        }

        return result
    }

    mutating func insert(number: Int) {
        let currentHead = self.head
        self.head = SingleLinkedNode(number)
        self.head!.next = currentHead
    }
    func delete(node: SingleLinkedNode) {}
    func min() -> Int? { return nil }
    func max() -> Int? { return nil }
    func predecessor(node: SingleLinkedNode) -> SingleLinkedNode? { return nil }
    func successor(node: SingleLinkedNode) -> SingleLinkedNode? { return nil }
}