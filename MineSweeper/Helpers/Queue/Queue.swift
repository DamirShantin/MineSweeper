//
//  Queue.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 28.04.2025.
//

import Foundation

struct Queue<T>: CustomStringConvertible {
    
    private var list = LinkedList<T>()
    
    var description: String {
        list.description
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(element: T) {
        list.append(value: element)
    }
    mutating func dequeue() -> T? {
        guard !list.isEmpty, let elem = list.first else { return nil}
        list.remove(node: elem)
        return elem.value
    }
    
}
