//
//  Stack.swift
//  tt
//
//  Created by Ashis Laha on 26/02/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import Foundation

// Error handling
enum StackOperationsError: Error {
    case InsufficientIntInStackToPerformOperation
    case StackIsEmpty
}

// define a stack
struct Stack {
    
    var items : [Int] = []
    
    // push
    mutating func push(item : Int) { items.append(item) }
    
    // pop
    @discardableResult
    mutating func pop() throws -> Int? {
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        return items.removeLast()
    }
    
    // top
    mutating func top() throws-> Int? {
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        return items.last
    }
    
    // duplicate
    mutating func duplicate() throws {
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        
        if let top = items.last {
            items.append(top)
        }
    }
    
    // addition
    mutating func add() throws {
        // add top 2 items
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        
        let firstPop = items.removeLast()
        guard !items.isEmpty else { throw StackOperationsError.InsufficientIntInStackToPerformOperation }
        let secondPop = items.removeLast()
        let result = firstPop + secondPop
        items.append(result)
    }
    
    // subtraction
    mutating func subtract() throws {
        // subtract top 2 Ints
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        
        let firstPop = items.removeLast()
        guard !items.isEmpty else { throw StackOperationsError.InsufficientIntInStackToPerformOperation }
        let secondPop = items.removeLast()
        let result = firstPop - secondPop
        items.append(result)
    }
}



