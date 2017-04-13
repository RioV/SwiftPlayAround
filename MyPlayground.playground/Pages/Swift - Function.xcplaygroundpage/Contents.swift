//: Playground - noun: a place where people can play
// nhathm01247@gmail.com

import UIKit

// Basic function declare
func sayHi() {
    print("Hi")
}
sayHi()

// Basic function with parameter
func functionWithParamter(value: Int) {
    print("Argument = \(value)")
}
// Call function with argument
functionWithParamter(value: 10)


// Baisc function with multi paramters
func functionWithMultiParameters(firstParamenter: Int, secondParameter: Double) {
    print("Result = \((Double(firstParamenter)) * secondParameter))")
}
functionWithMultiParameters(firstParamenter: 12, secondParameter: 2.5)


// Function without external name (without argument name)
// Using underscore "_" to ignore external name
// Or "Omitting Argument Labels"
func functionWithoutExternalName(_ name: String) {
    print("Hi \(name)")
}
functionWithoutExternalName("Swift")


// Function with return value
func multiply(_ number: Int, by multiplier: Int) -> Int {
    return number * multiplier
}
print(multiply(2, by: 3))


// Function with multi return values
func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int){
    return (number * factor, number / factor)
}
let resultOfMultiAndDivi = multiplyAndDivide(5, by: 2)
print(resultOfMultiAndDivi.product)
print(resultOfMultiAndDivi.quotient)


// Function with default parameter value
func calculate(_ number: Int, by magicNumber: Int = 10) -> Int{
    return number * magicNumber
}

calculate(3) // If not have second argument, default value of magicNumber will be used
calculate(3, by: 3)

/** Advanced parameter handling **/

// Can't change value of parameters inside function block
// Using "inout" to change value of parameters
func incrementValue(_ value: inout Int) {
    value += 1
}

var counter = 1
// Send argument by refereence (pass by reference), must using &
incrementValue(&counter)
print(counter)


// Function return OPTIONALS (parameters are optionals is the same)
func returnOptional(_ number: Int?) -> Int? {
    if let number = number {
        return number
    } else {
        return nil
    }
}

var argumentOptionals : Int? = nil
returnOptional(argumentOptionals)
argumentOptionals = 9
returnOptional(argumentOptionals)


/** OVERLOADING FUNCTION **/
// Function with same name will be difference if have:
// 1. Different number of parameters.
// 2. Different parameter types.
// 3. Different external parameter names.
// 4. Different return type
// Example:
// Sample 1.
func printDescription() {
    print("Nothing to print")
}
// Sample 2.
func printDescription(with name: String, and age: Int) {
    print("Name \(name), Age \(age)")
}
// Sample 3.
func printDescription(_ name: String,_ age: Int) {
    print("Name \(name), Age \(age) -- No External parameter names")
}
// Sample 4.
func printDescription(_ name: String, age: Int) -> Bool {
    print("Name \(name), Age \(age) -- With Return: Bool")
    return true
}
// Sample 5.
func printDescription(_ name: String, age: Int) -> String {
    print("Name \(name), Age \(age) -- With Return: String")
    return "Yeah"
}

// Now call functions
printDescription()                          // No params/argument (call sample 1)
printDescription(with: "Swift", and: 3)     // With params (call sample 2)
printDescription("Swift", 3)                // With same params but difference external argument name (call sample 3)
let result : Bool = printDescription("Swift", age: 3) // call sample 4
let resultString : String = printDescription("Swift", age: 3) // call sample 5
// Not that if function have same params and arguments like Sample 4 and Sample 5 
// then we must declare type of variable that will point to return value (like String or Bool)


/** VARIADIC PARAMETERS **/
// A variadic parameters accepts none or multi values of a specified type (same as Python???)
func showErrorWithMessage(_ message: String, for listOfErrors: String...) {
    for mes in listOfErrors {
        print("\(message) : \(mes)")
    }
}

showErrorWithMessage("Error", for: "Input Name", "Input Birthday", "Input Age")
// Note: A function may have at MOST one variadic parameter.


/** FUNTION AS VARIABLE (OR RETURN TYPE - is the same) **/
// Function is just same as another data type.
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func sub(_ a: Int, _ b: Int) -> Int {
    return a - b
}
// Set function to variable
var function = add
// Using variable as function
print(function(1, 20))

// Function as parameter
// We can using function as a parameter of other function
// Sample Function: calculate 2 first number (add or sub) then multiply with third parameter
func dynamicCalculate(_ paramFunction: (Int, Int) -> Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    let result = paramFunction(a, b)
    return (result * c)
}

// Using function
dynamicCalculate(add, 2, 4, 5) // (2 + 4) * 5 = 30
dynamicCalculate(sub, 2, 4, 5) // (2 - 4) * 5 = -10


/** NESTED FUNCTION **/
func movingCharacter(_ forward: Bool) {
    // Nested Function: move forward
    func moveForward() {
        print("Move Forward")
    }
    
    // Nested Function: move backward
    func moveBackward() {
        print("Move Backward")
    }
    
    if forward {
        moveForward()
    } else {
        moveBackward()
    }
}

movingCharacter(true)
movingCharacter(false)


/** NEVER RETURN FUNCTION **/
// Function designed to be NEVER return, then, 
// to be sure that feature maintain will never break the first rule by mistake,
// we use NEVER RETURN FUCNTION
func neverEverReturn() -> Never {
    print("Never Return, Ever")
    exit(1) // Must call to another never-returning function on all paths inside Never return function
}

neverEverReturn()