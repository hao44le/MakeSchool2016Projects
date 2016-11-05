//: [Previous](@previous)
/*:
 # Even more animals!
 
 Today is the day! Zoe now keeps track of giraffes, bees, AND unicorns, so she needs 3 more classes of animals added to the program. Luckily, we're prepared because we have a general Animal class with typical animal behaviors.
 
 - note: Copy your full `Animal`, `Tiger`, and `Bear` classes from the previous page
 
 */

// Copy your Animal class here
class Animal {
    // Put your instance variables here
    var name:String
    var favoriteFood:String
    init(name: String) {
        // put your initializer content here
        self.name = name
        self.favoriteFood = ""
    }
    
    func sleep() {
        // complete your sleep function here, noting the change from global to instance variables
        print("\(name) sleeps for 8 hours")
    }
    
    func eat(food: String) {
        // complete your eat function here!
        
        if food == favoriteFood {
            print("\(name) eats \(food)")
            print("YUM! \(name) wants more \(food)")
        } else {
            
            sleep()
        }
    }
}

// Complete the Tiger and Bear subclasses below
class Tiger: Animal {
    
    // this is your overridden initializer
    override init(name: String) {
        // don't forget a call to the superclass initializer!
        super.init(name: name)
        // set your favorite food here
        self.favoriteFood = "meat"
        //print("\(name) eats \(self.favoriteFood)")
    }
    override func sleep() {
        print("\(name) sleeps for 8 hours")
    }
    
}

class Bear: Animal {
    // complete the Bear class here, using the completed Tiger class as an example
    
    override init(name: String) {
        // put your initializer content here
        super.init(name: name)
        self.favoriteFood = "fish"
        //print("\(name) eats \(self.favoriteFood)")
    }
    // here, we override the sleep function
    override func sleep() {
        // add in your Bear-specific sleep code here
        print("\(name) hinernates for 4 months")
    }
}

/*:
 
 # Unicorns
 
 We're going to create 3 more subclasses of `Animal`: `Bee`, `Giraffe`, and `Unicorn`. Each class should set their own value for `favoriteFood`, and should override the `sleep` or `eat` methods, or both as appropiate.
 
 - callout(Challenge): Implement the `Unicorn` class as a subclass of `Animal`. In case you didn't know, unicorns love to eat marshmallows and they sleep in clouds. In other words, their `favoriteFood` is `"marshmallows"` and calling the `sleep` method on a `Unicorn` should print `"<name> sleeps in a cloud"`. We've given you some hints in the provided code below.
 */

// Implement the Unicorn class here as a subclass of Animal
// Hint: Override the initializer and sleep methods
class Unicorn: Animal {
    
    override init(name: String) {
        
        // now, we call the superclass init method to set the name variable.
        super.init(name: name)
        // set your favorite food here...
        self.favoriteFood = "marshmallows"
    }
    
    override func sleep() {
        // your overridden sleep code...
        print("\(name) sleeps in a cloud")
    }
}

/*:
 
 # Giraffes
 
 - callout(Challenge): Implement the `Giraffe` class as a subclass of `Animal`. Giraffes are vegetarian, so they only eat leaves. If you feed `"leaves"` to a `Giraffe`, they will happily tell you `"YUM!!! <name> wants more leaves"` (just like how `Tiger`s respond to `"meat"`). However, if you feed them anything else, they will shout `"YUCK!!! <name> will not eat <food>"` to let you know they don't like what you fed them. You'll need to override the `eat` method for the Giraffe class to model this behavior. In some cases, you might be able to call the superclass's implementation of the `eat` method to avoid having to recode the parts of this behavior that's similar to your generic `Animal` class.
 
 */

// Implement the Giraffe class here as a subclass of Animal
// Hint: Implement the initializer method and override the eat method
class Giraffe: Animal {
    
    override init(name: String) {
        super.init(name: name)
        self.favoriteFood = "leaves"
    }
    
    override func eat(food: String) {
        // check here if you don't like the food you were given...
        // don't forget a call to the superclass eat function!
        
        if food == favoriteFood {
            print("\(name) eats \(food)")
            print("YUM! \(name) wants more leaves")
        } else {
            print("YUCK! \(name) will not eat \(food)")
        }
    }
}


/*:
 
 # Bees
 
 - callout(Challenge): Implement the `Bee` class as a subclass of `Animal`. Bees only eat pollen and will complain in the same way as giraffes if you feed a `Bee` anything other than `"pollen"`. Additionally, bees never sleep, so if you call the `sleep` method on the Bee class, it should print `"<name> never sleeps"` instead of the standard sleep behavior.
 */

// Implement the Bee class here as a subclass of Animal
// Hint: Implement the initializer method and override the sleep and eat methods
class Bee: Animal {
    override init(name: String) {
        
        // now, we call the superclass init method to set the name variable.
        super.init(name: name)
        // set your favorite food here...
        self.favoriteFood = "pollen"
    }
    override func eat(food:String){
        // complete your eat function here!
        
        if food == favoriteFood {
            print("\(name) eats \(food)")
            print("YUM! \(name) wants more \(food)")
        } else {
            print("YUCK! \(name) will not eat \(food)")
        }
    }
    
    override func sleep() {
        // your overridden sleep code...
        print("\(name) never sleeps")
    }
}


/*:
 ## Testing
 
 This time, you'll be in charge of writing your own test code! It should output exactly this:
 
     Tigger eats meat
     YUM!!! Tigger wants more meat
     Pooh eats fish
     YUM!!! Pooh wants more fish
     Pooh eats meat
     Pooh hibernates for 4 months
     Rarity eats marshmallows
     YUM!!! Rarity wants more marshmallows
     Rarity sleeps in a cloud
     YUCK!!! Gemma will not eat meat
     Gemma eats leaves
     YUM!!! Gemma wants more leaves
     Gemma sleeps for 8 hours
     YUCK!!! Stinger will not eat ice cream
     Stinger eats pollen
     YUM!!! Stinger wants more pollen
     Stinger never sleeps
 
 - callout(Hint): The zoo currently has one animal of each type. There is:
    - A `Tiger` named Tigger
    - A `Bear` named Pooh
    - A `Unicorn` named Rarity
    - A `Giraffe` named Gemma
    - A `Bee` named Stinger
 
 */
let tiger = Tiger(name: "Tigger")
tiger.eat("meat")
let bear = Bear(name: "Pooh")
bear.eat("fish")
bear.eat("meat")
let rarity = Unicorn(name: "Rarity")
rarity.eat("marshmallows")
rarity.sleep()
let gemma = Giraffe(name: "Gemma")
gemma.eat("meat")
gemma.eat("leaves")
gemma.sleep()
let stinger = Bee(name: "Stinger")
stinger.eat("ice cream")
stinger.eat("pollen")
stinger.sleep()



//: [Next](@next)
