//
//  LinkedList.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 28.04.2025.
//

import Foundation

class LinkedNode <T> {
    var value: T
    var next: LinkedNode<T>?
    var prev: LinkedNode<T>?
    
    init(value: T){
        self.value = value
    }
}

struct LinkedList<T>: CustomStringConvertible {
    
    
    private var head: LinkedNode<T>?
    private var tail: LinkedNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: LinkedNode<T>? {
        return head
    }
    
    var last: LinkedNode<T>? {
        return tail
    }
    
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil { text += ", "}
        }
        return text + "]"
    }
    
    mutating func append(value: T) {
        let newNode = LinkedNode(value: value)
        
        if tail != nil {
            newNode.prev = tail
            tail?.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    mutating func remove(node: LinkedNode<T>) -> T {
        let next = node.next
        let prev = node.prev
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        if next == nil {
            tail = prev
        }
        
        return node.value
    }
}
