// www.SwiftCodeComposer.com

// Optionals Toolbox Essentials
// by Alistair Cooper

//***************************************************

import Foundation

// Optional Binding

struct Album {
    let title: String
    let yearReleased: Int
    let chartPosition: Int?
}

struct RockStar {
    let birthName: String
    let stageName: String?
    let yearOfBirth: Int
    let band: String
    let role: String
    let debutAlbum: Album?
}

let queenDebut = Album(title: "Queen", yearReleased: 1973, chartPosition: 24)

let freddie = RockStar(birthName: "Farrokh Bulsara", stageName: "Freddie Mercury", yearOfBirth: 1946, band: "Queen", role: "lead singer", debutAlbum: queenDebut)

let roger = RockStar(birthName: "Roger Taylor", stageName: nil, yearOfBirth: 1949, band: "Queen", role: "drummer", debutAlbum: queenDebut)



// Optional binding with "if let"

if let stageName = freddie.stageName {
    print("Some rock stars have cool stage names like \(stageName)")
} else {
    print("Not all rock stars use stage names")
}

//**********************

// Optional chaining

if let album = freddie.debutAlbum?.title {
    
    // now safely use temporary constant within scope of code block
    print(album) // "Queen"  (...yes it's a self titled album)
}


// Guard Pyramid of Doom Example

struct BrassSection {
    let trumpets: Int?
    let trombones: Int?
    let frenchHorns: Int?
    let tubas: Int?
}

func allBrassInstruments(band: BrassSection) {
    if let trumpets = band.trumpets {
        // there are trumpets
        if let trombones = band.trombones {
            // there are trombones
            if let frenchHorns = band.frenchHorns {
                // there are French horns
                if let tubas = band.tubas {
                    // there are tubas. So:
                    print("This brass section has 4 kinds of instrument: \(trumpets) trumpets, \(frenchHorns) French horns, \(trombones) trombones and \(tubas) tubas")
                } else {
                    print("The section has no tubas")
                }
            } else {
                print("The section has no French horns")
            }
            
        } else {
            print("The section has no trombones")
        }
    } else {
        print("The section has no trumpets")
    }
}

// using guard

func allBrassInstruments2(band: BrassSection) {
    guard let trumpets = band.trumpets else {
        print("The section has no trumpets")
        return
    }
    
    guard let frenchHorns = band.frenchHorns else {
        print("The section has no French horns")
        return
    }
    
    guard let trombones = band.trombones else {
        print("The section has no trombones")
        return
    }
    
    guard let tubas = band.tubas else {
        print("The section has no tubas")
        return
    }
    
    print("This brass section has 4 kinds of instrument: \(trumpets) trumpets, \(frenchHorns) French horns, \(trombones) trombones and \(tubas) tubas")
}

let brassSection = BrassSection(trumpets: nil, trombones: 3, frenchHorns: 4, tubas: 1)
allBrassInstruments2(brassSection)
allBrassInstruments(brassSection)


// Guard Example 2

// create variable with current year
let date = NSDate()
let calendar = NSCalendar.currentCalendar()
let components = calendar.components([.Day , .Month , .Year], fromDate: date)
let currentYear = components.year

// define error cases
enum AlbumYearError: ErrorType {
    case YearNotProvided
    case YearTooEarly
}

// Without guard - behold the pyramid
func howOldIsAlbum(albumYear: Int?) throws {
    
    if let albumYear = albumYear {
        if albumYear > 1948 {
            print("The recording is \(currentYear - albumYear) years old")
        } else {
            throw AlbumYearError.YearTooEarly
        }
    } else {
        throw AlbumYearError.YearTooEarly
    }
}


// Using guard

func howOldIsAlbum2(albumYear: Int?) throws {
    
    guard let albumYear = albumYear else {
        throw AlbumYearError.YearNotProvided
    }
    
    guard albumYear > 1948 else {
        throw AlbumYearError.YearTooEarly
    }
    
    print("The recording is \(currentYear - albumYear) years old")
}

// implementation

do {
    try howOldIsAlbum(freddie.debutAlbum?.yearReleased)
    
} catch AlbumYearError.YearNotProvided {
    print("No album year was provided")
    
} catch AlbumYearError.YearTooEarly {
    print("Year provided is before albums were recorded")
}


// The result being: "The recording is 43 years old"


//**********************

// Forced Unwrapping

// this extends the RockStar struct
extension RockStar {
    
    func description() -> String {
        if stageName != nil {
            return "\(stageName!) is known as the \(role) for \(band)"
            
        } else {
            return "\(birthName) is known as the \(role) for \(band)"
        }
    }
}

roger.description()  // "Roger Taylor is known as the drummer for Queen"

freddie.description()  // "Freddie Mercury is known as the lead singer for Queen"

//*********************

// Nil Coalescing Operator

let newRockStar = RockStar(birthName: "John Smith", stageName: nil, yearOfBirth: 2014, band: "The Johns", role: "flautist", debutAlbum: nil)

let newStageName = newRockStar.stageName ?? "TBD"

newStageName  // "TBD"

// can also use ?? without assigning to a variable. For example:
print("John Smiths stage name is \(newRockStar.stageName ?? "TBD")")







