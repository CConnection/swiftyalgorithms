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
    mutating func delete(node: SingleLinkedNode)
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
    mutating func delete(node: SingleLinkedNode) {
        if node === self.head {
            self.head = self.head?.next
        } else {
            var current = self.head
            while let next = current?.next, next !== node {
                current = next
            }

            current?.next = current?.next?.next
        }
    }

    func min() -> Int? {
        var current = self.head
        var currentMin = current?.number

        while let currentNode = current, let minimum = currentMin {
            if (currentNode.number < minimum) {
                currentMin = currentNode.number
            }
            current = current?.next
        }

        return currentMin
    }
    func max() -> Int? {
        var current = self.head
        var currentMax = current?.number

        while let currentNode = current, let maximum = currentMax {
            if (currentNode.number > maximum) {
                currentMax = currentNode.number
            }
            current = current?.next
        }

        return currentMax
    }
    func predecessor(node: SingleLinkedNode) -> SingleLinkedNode? {
        var currentPreNode: SingleLinkedNode?

        var iterator = self.head
        while let iteratorNode = iterator {
            if iteratorNode.number < node.number {
                currentPreNode = iteratorNode
                break
            }

            iterator = iterator?.next
        }

        iterator = self.head
        while let iteratorNode = iterator, let currentPredecessorNode = currentPreNode {
            if iteratorNode.number > currentPredecessorNode.number && iteratorNode.number < node.number {
                currentPreNode = iteratorNode
            }

            iterator = iterator?.next
        }

        return currentPreNode
    }
    func successor(node: SingleLinkedNode) -> SingleLinkedNode? {
        var currentSucNode: SingleLinkedNode?

        var iterator = self.head
        while let iteratorNode = iterator {
            if iteratorNode.number > node.number {
                currentSucNode = iteratorNode
                break
            }

            iterator = iterator?.next
        }

        iterator = self.head
        while let iteratorNode = iterator, let currentSuccessNode = currentSucNode {
            if iteratorNode.number < currentSuccessNode.number && iteratorNode.number > node.number {
                currentSucNode = iteratorNode
            }

            iterator = iterator?.next
        }

        return currentSucNode
    }
}