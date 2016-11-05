//: Playground - noun: a place where people can play

import UIKit

//MARK: Map

let values = [2.0, 4.0, 5.0, 6.0]

// The hard way

var badSquares = [Double]()

for value in values {
    badSquares.append(value * value)
}

print(badSquares)


// Same result by using map function

let sqaure = values.map { (value:Double) -> Double in
    return value * value
}

print(sqaure)

let sqaure2 = values.map {
    $0 * $0
}

print(sqaure2)


// MARK : Filter

let digits = [1, 4, 10 ,15]

let evens = digits.filter { (digit:Int) -> Bool in
    if(digit % 2 == 0 ){
        return true
    }else {
        return false
    }
}

print(evens)


let evens2 = digits.filter { $0 % 2 == 0 }
print(evens2)



//MARK : Reduce

let sum = digits.reduce(0) { (first:Int, second:Int) -> Int in
    return first + second
}
print(sum)

let sum2 = digits.reduce(0) {
    $0 + $1
}

print(sum2)


let words = ["Rectangle", "America", "Megaphone", "Monday", "Butthole"]

let sentence = words.reduce("I'm going to type every word I know!"){
    $0 + " \($1)!"
}
print(sentence)

