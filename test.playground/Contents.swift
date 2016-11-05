//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class MyRootClass {
    var someVariable:Int
    init() {
        someVariable = 2
    }
    init(otherObject:MyRootClass) {
        someVariable = otherObject.someVariable
    }
    func copy() -> MyRootClass {
        return MyRootClass(self)
    }
}
