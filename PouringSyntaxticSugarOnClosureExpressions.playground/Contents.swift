// www.SwiftCodeComposer.com

// Pouring Some Syntaxtic Sugar on Closure Expressions
// by Alistair Cooper

//***************************************************

import UIKit


func upOctave(n: Int) -> Int {
    return n * 2
}

let upOctaveFunc = upOctave

let freqArray = [330, 247, 196, 147, 110, 82]

let newArray = freqArray.map(upOctaveFunc)



// step 1 - full closure expression

let arrayStep1 = freqArray.map({ (n: Int) -> Int in return n * 2 })

arrayStep1 // = [660, 494, 392, 294, 220, 164]


// step 2 - take away the types

let arrayStep2 = freqArray.map({ n in return n * 2 })


// step 3 - loose the return keyword

let arrayStep3 = freqArray.map({ n in n * 2 })


// step 4 - who needs arguments?

let arrayStep4 = freqArray.map({ $0 * 2 })


// step 5 - trailing closures

let arrayStep5 = freqArray.map() { $0 * 2 }


//*********************


let frontRowVolume = [110.2, 99.4, 105.4, 100.1]

// step 1 - full closure expression

let backRowVolume = frontRowVolume.map({ (n: Double) -> Double in return n - (20 * log10(200/10)) })

backRowVolume  // [84.18, 73.38, 79.34, 74.08]


// step 2 - take away the types

let backRowVolume2 = frontRowVolume.map({ n in return n - (20 * log10(200/10)) })


// step 3 - loose the return keyword

let backRowVolume3 = frontRowVolume.map({ n in n - (20 * log10(200/10)) })


// step 4 - who needs arguments?

let backRowVolume4 = frontRowVolume.map({ $0 - (20 * log10(200/10)) })


// step 5 - trailing closures

let backRowVolume5 = frontRowVolume.map() { $0 - (20 * log10(200/10)) }

