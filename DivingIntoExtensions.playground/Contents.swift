// www.SwiftCodeComposer.com

// Diving into Swift Extensions 
// by Alistair Cooper

//***************************************************

// Example #1

extension Double {
    
    var isEven: Bool {
        
        if (self % 2 == 0) {
            return true
        } else {
            return false
        }
    }
}

10.0.isEven // true
9.9.isEven  // false

// can also use the extension property in closures, for example

var myArray: [Double] = [9.8, 4.0, 7.6, 9.1, 8.0]

let newArray = myArray.map() { $0.isEven }

newArray    // [false, true, false, false, true]

let filteredArray = myArray.filter() { $0.isEven }

filteredArray    // [4, 8]


//***************************************************

// Example #2

extension Int {
    
    mutating func addNumber(number: Int) {
        self += number
    }
}

var distance = 7   // (must be a var if it's going to be mutated)

distance.addNumber(8)    // 15
distance.addNumber(3)    // 18
distance.addNumber(11)   // 29

// each call to the .addNumber() method mutates the existing stored property within the Int struct


//***************************************************

// Example #3

extension Double {
    
    // For distance
    
    var metersToKm: Double { return self / 1000.0 }
    
    var metersToYd: Double { return self * 1.0936133 }
    
    var metersToMi: Double { return self / 1609.34 }
    
    var milesToMeters: Double { return self * 1609.34 }
    
    // For pace
    
    var secPerKmToSecPerMile: Double { return self * 1.60934 }
    
    var secPerMileToSecPerKm: Double { return self / 1.60934 }
    
}

// implementation in swift file designated for calculator brain

var distanceMeters: Double = 42195.0   // distance of a marathon

var distanceMiles = distanceMeters.metersToMi   // 26.2188...


//***************************************************

// Example #4

extension String {
    
    var isNaaN: Bool {
        switch self {
        case "garlic naan": return true
        case "keema naan": return true
        case "plain naan": return true
        default: break
        }
        return false
    }
}

"papadum".isNaaN      // FALSE
"garlic naan".isNaaN  // TRUE


//  #breadrelatedextensions #extensions #computedproperties #swiftlang



