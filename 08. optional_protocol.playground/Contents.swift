//: Playground - noun: a place where people can play

import UIKit

protocol someProtocol {
    func a()
    func b()
}

extension someProtocol {
    func c() {
        print("This is optional protocol functionality")
    }
    var someProperty: String { // you can override this property also
        return "some computed property"
    }
}

class A: someProtocol {
    func a() {
        print("a")
    }
    func b() {
        print("b")
    }
    func c() {
        print("I am overriding C functionality")
    }
}

let obj = A()
obj.a()
obj.b()
obj.c()
print(obj.someProperty)


let point: (x: Int, y:Int) = (1,1)

switch point {
case let (x,_) where x == 0: print("on x axis")
case let (_,y) where y == 0: print("on y axis")
case let (x,y) where x == y: print("create multiple of 45 degree angle with root")
default: print("default")
}

let a = "123"
if let str = Int(a) {
    print(str)
}

let dictionary = ["a": 1, "b": 2, "c": 6, "bb": 3, "as": 4, "bd": 5]
let d = dictionary.sorted{ $0 < $1 }
print(d)


public protocol User {

    /// Name
    var firstname: String { get set }

    /// Lastname
    var lastname: String { get set }

    ///Init
    init()
}

struct MyAppUser: User {
    init() {
        self.firstname = ""
        self.lastname = ""
    }

    init(firstName: String, lastName: String) {
        self.firstname = firstName
        self.lastname = lastName
    }
    var firstname: String

    var lastname: String
}

var user1 = MyAppUser()
user1.firstname = "Ashis"
user1.lastname = "laha"
print(user1)

let user2 = MyAppUser(firstName: "Kunal", lastName: "Pradhan")
print(user2)

let count = 0
for _ in 0..<count {
    print("nothing")
}



var jsonString = """
{
"name1": "Ashis",
"surname": "Laha",
"age": 28,
"name" : {
"last": "laha"
},
"married": "YES"
}
"""

var i: Optional<Int>
if i == 0 { // it is conforming Equatable protocol
    print("0")
} else {
    print("not 0")
}


func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

let parsedResult = convertToDictionary(text: jsonString)! as NSDictionary
parsedResult

let fullname = parsedResult["name.last"]

let dict: [String: Any] = ["a": 1, "c":"d", "e": true]
dict.forEach{ print($0, $1) }


