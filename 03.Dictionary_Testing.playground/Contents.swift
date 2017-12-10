//: Playground - noun: a place where people can play

import Foundation

class MyClass { }
class Apple : MyClass { }
class Ant : MyClass { }
class Ambulance : MyClass { }

class Test {
    
    var dictionary : [String : [MyClass.Type]] = [:]
    let items : [MyClass.Type] = [Apple.self, Ant.self, Ambulance.self]
    let key = "a"
    
    public func insert(key : String, items : [MyClass.Type] ) {
        guard !items.isEmpty else { return }
        
        items.forEach { (item) in
            if dictionary[key] == nil {
                dictionary[key] = [item]
            } else {
                dictionary[key]?.append(item)
            }
        }
    }
}

let test = Test()
test.insert(key: test.key, items: test.items)
print(test.dictionary)

