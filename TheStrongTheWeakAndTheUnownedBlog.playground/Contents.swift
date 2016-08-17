// www.SwiftCodeComposer.com

// The Strong, the Weak and the Unowned
// by Alistair Cooper

//***************************************************


// Example 1

class Guitarist {
    let name: String
    
    init(name: String) {
        self.name = name
        print ("Memory is allocated for \(name)")
    }
    var favoriteGuitar: Guitar?
    deinit {
        print("Guitarist \(name) is being deinitialized")
    }
}

class Guitar {
    let make: String
    let model: String
    
    init(make: String, model: String) {
        self.make = make
        self.model = model
        print ("Memory is allocated for \(make) \(model)")
    }
    weak var knownPlayer: Guitarist?
    deinit {
        print("Guitar \(make) is being deinitialized")
    }
}

// define two variables with optional type nil
var guitaristReference: Guitarist?
var guitarReference: Guitar?

// initialize these varaibles
guitaristReference = Guitarist(name: "JimiHendrix")
guitarReference = Guitar(make: "Fender", model: "Stratocaster")

// ! is used to unwrap and access the instances stored the variables
guitaristReference!.favoriteGuitar = guitarReference
guitarReference!.knownPlayer = guitaristReference


guitaristReference = nil
guitarReference = nil


// Example 2 Unowned

class GuitarBuyer {
    let name: String
    var customShopGuitar: CustomGuitar?
    
    init(name: String) {
        self.name = name
        print ("Memory is allocated for \(name)")
    }
    deinit {
        print("Guitar buyer \(name) is being deinitialized")
    }
}

class CustomGuitar {
    let orderNumber: Int
    unowned let guitarBuyer: GuitarBuyer
    
    init(orderNumber: Int, guitarBuyer: GuitarBuyer) {
        self.orderNumber = orderNumber
        self.guitarBuyer = guitarBuyer
    }
    deinit {
        print("Guitar order \(orderNumber) is being deinitialized")
    }
}

// implementation

var guitarBuyer: GuitarBuyer?

guitarBuyer = GuitarBuyer(name: "Eric Johnson")
guitarBuyer!.customShopGuitar = CustomGuitar(orderNumber: 198234, guitarBuyer: guitarBuyer!)

// deinit GuitarBuyer instance

guitarBuyer = nil  // both deinit print statements for GuitarBuyer and CustomGuitar are called







