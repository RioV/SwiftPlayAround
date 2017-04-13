//: [Previous](@previous)

import Foundation

func countingClosure() -> (() -> Int) {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

print(counter1())
print(counter1())
print(counter1())
print(counter1())
print(counter1())
print(counter2())