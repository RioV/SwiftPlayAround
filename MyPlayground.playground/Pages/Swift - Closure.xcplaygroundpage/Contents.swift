//: Playground - noun: a place where people can play
// nhathm01247@gmail.com

import Foundation

/** DECLARE A CLOSURE **/

// Declare a variable to hold a closure
var add: (Int, Int) -> Int

// Assign a closure to a variable
add = { (a: Int, b: Int) -> Int in
    return a + b
}

// Or combine like this
var sub = { (a: Int, b: Int) -> Int in
    return a - b
}

add(1, 2)
sub(1, 2)

// Closure with no params ad no return value
let noLifeClosure: () -> Void = {
    print("Programmer have no Life")
}

noLifeClosure()

/** SHORTHAND SYNTAX **/

// Not need return keyword when only have single return statement
add = {(a: Int, b: Int) -> Int in
    a + b
}
add(1, 1)

// Remove return type and parameters type
// Because we already declare: var add: (Int, Int) -> Int
add = {(a, b) in
    a + b
}

add(9, 2)

// Remove parameters, Swift will refer parameters by number, start from 0:
add = {
    $0 + $1
}

add(99, 1)

/*** BUILDIN CLOSURE***/

// SORTED
let ages: [Int] = [1, 6, 99, 2, 5, 3, 57, 28, 19]
var sortedAges = ages.sorted()
// Using custom closure to change sort order
sortedAges = ages.sorted {
    $0 > $1
}


// FILTER
let memberAges: [Int] = [1, 6, 12, 17, 19, 22, 35, 43, 57]
let adults = memberAges.filter {
    $0 > 17
}

// MAP
// Note 10_000 = 10000, this is Swift way to make easy to read source code
let carSalePrices = [10_000, 34_000, 45_000, 99_000, 103_000, 999_696]
let carPricesInVietNam = carSalePrices.map {
    $0 * 200/100
}

// REDUCE
// Note 39_000 = 39000, this is Swift way to make easy to read source code
// Array of tuple (tuple format: (Book name, book quantity, book price)
let books: [(String, Int, Double)] = [("A", 12, 39_000),
                                      ("B", 9, 22_000),
                                      ("F", 22, 13_000),
                                      ("T", 4, 9_000)]

// Using reduce to calculate total prices of all books
let sumPrice = books.reduce(0) {
    // Init value (0) or current value + (number of books * price of each book)
    $0 + Double($1.1) * $1.2
}




var numbers = [0, 2, 3, 5, 10, 2]
numbers.sort {
    $0 > $1
}

