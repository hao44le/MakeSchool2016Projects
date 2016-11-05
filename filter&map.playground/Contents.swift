//: Playground - noun: a place where people can play

import UIKit

// MARK: - Map

let values = [2.0, 4.0, 5.0, 7.0]

// The hard way

var badSquares = [Double]()

for value in values {
    badSquares.append(value * value)
}
print(badSquares)


// The easy way

let squares = values.map { $0 * $0 }
print(squares)

// Same thing, different syntax

let squares2 = values.map { (value: Double) -> Double in
    return value * value
}

// MARK: - Filter

let digits = [1, 4, 10, 15]

let evens = digits.filter { $0 % 2 == 0 }
print(evens)

let bigNumbers = digits.filter { number in
    return number > 5
}
print(bigNumbers)

// MARK: - Reduce

let sum = digits.reduce(0) { $0 + $1 }
print(sum)

let words = ["Rectangle", "America", "Megaphone", "Monday", "Butthole"]

let sentence = words.reduce("I'm going to type every word I know!") { sentence, word in
    return sentence + " \(word)!"
}
print(sentence)




func getDayOfWeek(_ today:String) -> Int? {
    let formatter  = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    if let todayDate = formatter.date(from: today) {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    } else {
        return nil
    }
}
getDayOfWeek("2016-09-18")

