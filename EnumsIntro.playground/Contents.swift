// www.SwiftCodeComposer.com

// An Introductory Romp in The Garden of Enumerations
// by Alistair Cooper

//***************************************************

// Example #1

enum ThingsRickAstleyWontDo {
    case GiveYouUp
    case LetYouDown
    case RunAround
    case DesertYou
}

// Implementation

var heIsNeverGoingTo = ThingsRickAstleyWontDo.GiveYouUp    // assigned the type "ThingsRickAstleyWontDo" to the variable

heIsNeverGoingTo = .LetYouDown
heIsNeverGoingTo = .RunAround
heIsNeverGoingTo = .DesertYou


//***************************************************

// Example #2 Raw Values 

enum CelloString: Int {
    case CString = 1
    case GString
    case DString
    case AString
}

var string = CelloString(rawValue: 3)  // = .Dstring
// Or
var anotherString = CelloString.AString.rawValue   // = 4
// can also retrieve raw value:
string?.rawValue   // = Optional(3)


//***************************************************

// Example #3 Associated Value

enum DrumPart {
    case KickDrum (brand: DrumBrand, size: Int)
    case SnareDrum (brand: DrumBrand, size: Int)
    case HiHats (brand: CymbalBrand, size: Int)
    case Cymbal (brand: CymbalBrand, cymbalType: CymbalType, size: Int)
    case Tom (brand: DrumBrand, size: Int)
}

enum CymbalBrand {
    case Zildjian
    case Sabian
    case Paiste
}

enum CymbalType {
    case Crash
    case Ride
    case China
    case Splash
}

enum DrumBrand {
    case DW
    case Pearl
    case Yamaha
}

let myKick = DrumPart.KickDrum(brand: .Pearl, size: 22)
let mySnare = DrumPart.SnareDrum(brand: .Pearl, size: 14)
let myHats = DrumPart.HiHats(brand: .Sabian, size: 16)
let myFloorTom = DrumPart.Tom(brand: .Pearl, size: 16)

let myDrumKit: [DrumPart] = [myKick, mySnare, myHats, myFloorTom]  // an array of custom type DrumPart

// This model might lend itself to an app where the user's creating a virtual drum kit from a finite choice of parts.


//***************************************************

// Example 4 

enum TuningReferenceHz: Int {
    case Baroque = 415
    case Standard = 440
    case NYPhil = 442
    case ViennaPhil = 443
    case BerlinPhil = 445
    
    func description() -> String {
        switch self {
        case .Baroque: return "\(self) tuning was more commonly used in the 17th century"
        case .Standard: return "\(self) tuning was adopted as the standard in western music in the early 19th century"
        case .NYPhil: return "The New York Philharmonic tunes to \(self.rawValue)Hz"
        case .ViennaPhil: return "The Vienna Philharmonic tunes to \(self.rawValue)Hz"
        case .BerlinPhil: return "The Berlin Philharmonic tunes to \(self.rawValue)Hz"
        
        }
    }
}

// use these values elsewhere:
let myAppTuningPitch = TuningReferenceHz.Baroque.rawValue    // tuning now set to A = 415Hz

// give the user a brief description of the tuning standard
let descriptionLabel = TuningReferenceHz.BerlinPhil.description()






