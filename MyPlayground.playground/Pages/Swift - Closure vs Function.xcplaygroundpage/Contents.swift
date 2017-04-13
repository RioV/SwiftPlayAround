//: Playground - noun: a place where people can play
// nhathm01247@gmail.com

import Foundation

// Requirement: write a function take Int, Int, Int and a function that sum first two Int params and then sub the third Int.

// Do it function way
// Declare a function
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// Declare other function has parameter is a function/closure
func dynamicCalculate(_ a: Int, _ b: Int, _ c: Int, _ paramFunction: (Int, Int) -> Int) -> Int {
    let result = paramFunction(a, b)
    return (result - c)
}

// Then pass a function as argument
dynamicCalculate(1, 2, 3, add)

// Do it Closure way
dynamicCalculate(4, 5, 6, { (a: Int, b: Int) -> Int in
    return a + b
}) //-> no need to declare a closure outside of function call

// Or shorter
dynamicCalculate(7, 8, 9, {$0 + $1})

/*** Trailing Closure ***/
// If the last parameter of a function is a closure, like this one
// We can move the closure outside of function call:
dynamicCalculate(7, 8, 9) {
    $0 + $1
}

//////////////////////////////////////
// If function have 1 parameter, and this is closure, then we do not need to write () after function call.
// Example
func functionWithParamIsClosure(params: (Int) -> Int) {
    print("Function With Parameter is Closure. Result = \(params(4))")
}

// Send closure as params
functionWithParamIsClosure(params: {(a: Int) -> Int in
    return a * a
})

// But can rewrite as this
functionWithParamIsClosure {
    return $0 + $0
}
