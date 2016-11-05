//: [Previous](@previous)
/*:
 
 # Favorite Foods
 
 Great! Now, you'll write another function and use an if-statement. We'll also use a variable to keep track of a tiger's favorite food. The variable is named `favoriteFood` and is already set up for you in the starter code below.
 
 - important: We refer to the `favoriteFood` variable as being a "global" variable, since it is in the _outermost scope_ of the program – as opposed to it being inside a function or another statement that has curly braces. If the variable was defined inside a function, we would say it's "in the functions scope". If it was declared inside an if-statement, it would be "in the if-statement's scope". Furthermore, if it was inside a class, it in "class' scope." We'll talk more about that last one later.
 
 - callout(Challenge): Write a function named eat that takes two arguments: `name` and `food`. This function should print "`<name> eats <food>`" each time it's called.
 
 But wait – there's more! The `eat` function should check if the food argument is equal to the global variable `favoriteFood`. If the values are equal, the function should then also print "`YUM!!! <name> wants more <food>`". If they are not equal, the eat function should call the sleep function you wrote in Problem 1 (you can copy it from the previous page) and pass the value of `name` as an argument to sleep.
 
 This function call:
 
     eat("Tigger", food: "meat")
 
 should print this output exactly:
 
     Tigger eats meat
     YUM!!! Tigger wants more meat
 
 */

let favoriteFood = "meat"

func sleep(name: String) {
    print("\(name) sleeps for 8 hours")
}

func eat(name: String, food: String) {
    if food == favoriteFood {
        print("YUM! \(name) wants more \(food)")
    } else {
        sleep(name)
    }
}

eat("Tigger", food: "meat")

//: [Next](@next)
