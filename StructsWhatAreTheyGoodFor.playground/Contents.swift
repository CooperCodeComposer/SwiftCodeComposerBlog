// www.SwiftCodeComposer.com

// Structs, What Are They Good For?
// by Alistair Cooper

//***************************************************


// Example 1

struct EqBandSetting {
    var frequency: Double
    var Q: Double
    var gain: Double
}

// implementation

class Equalizer {
    
    // properties with default values
    
    var bass: EqBandSetting = EqBandSetting(frequency: 250.0, Q: 1.0, gain: 0.0)
    var mid: EqBandSetting = EqBandSetting(frequency: 2000.0, Q: 1.0, gain: 0.0)
    var treble: EqBandSetting = EqBandSetting(frequency: 6000.0, Q: 1.0, gain: 0.0)
    
    // initializer with default values 
    
    init(){}
    
    // initializer with custom values
    
    init(bass: EqBandSetting, mid: EqBandSetting, treble: EqBandSetting) {
        self.bass = bass
        self.mid = mid
        self.treble = treble
    }
}

// Declare setting for a guitar eq
let eqBass = EqBandSetting(frequency: 250.0, Q: 0.35, gain: -5.8)
let eqMid = EqBandSetting(frequency: 4000.0, Q: 0.2, gain: -2.1)
let eqTreble = EqBandSetting(frequency: 8000.0, Q: 1.1, gain: -7.0)

let guitarEq = Equalizer(bass: eqBass, mid: eqMid, treble: eqTreble)


//******************************************

// Example 2

// An Effects superclass might be setup like this

enum Channels {
    case Mono
    case Stereo
}

enum Category {
    case Eq
    case Compressor
    case Reverb
    case Modulation
    case Other
}

class Effect {
    var channels: Channels
    var category: Category
    
    init(channels: Channels, category: Category) {
        self.channels = channels
        self.category = category
    }
}


//******************************************

// Example 3

eqBass.frequency  // 250.0 - the original bass frequency setting

// assign it to a new variable
var eqBassCopy = eqBass

// mutate the copy
eqBassCopy.frequency = 375

eqBass.frequency // 250 - the original frequency is unchanged
eqBassCopy.frequency // 375 - the copy has mutated


//******************************************

// Example 4

// Here's the instance of the guitar eq class created earlier
guitarEq

guitarEq.bass.gain // -5.8


// Assign original instance to new variable
var anotherGuitarEq = guitarEq

// Now change a property within anotherGuitarEq
anotherGuitarEq.bass.gain = -7.5

guitarEq.bass.gain // -7.5 - so the original instance is ALSO mutated


// Let's tweak the Q of the treble band
anotherGuitarEq.treble.Q = 0.2

guitarEq.treble.Q // 0.2 - The original instance is ALSO mutated


// It works BOTH ways. For example, changing property on original instance

guitarEq.mid.frequency = 2500.0

anotherGuitarEq.mid.frequency // 2500.0 - Property also mutated on other instance


//******************************************

// Example 5

// Presets for the EQ stored in separate "PluginModel.swift" file

struct EqPreset {
    let highBoost = Equalizer(
        bass: EqBandSetting.init(frequency: 250.0, Q: 1.0, gain: 0.0),
        mid: EqBandSetting.init(frequency: 1000.0, Q: 1.0, gain: 0.0),
        treble: EqBandSetting.init(frequency: 6000.0, Q: 0.6, gain: 4.5))
    
    let highLowCut = Equalizer(
        bass: EqBandSetting.init(frequency: 220.0, Q: 0.6, gain: -24.0),
        mid: EqBandSetting.init(frequency: 1000.0, Q: 1.0, gain: 0.0),
        treble: EqBandSetting.init(frequency: 6000.0, Q: 0.7, gain: -48.0))
    
    let warmer = Equalizer(
        bass: EqBandSetting.init(frequency: 220.0, Q: 1.0, gain: 0.0),
        mid: EqBandSetting.init(frequency: 500.0, Q: 0.9, gain: 3.0),
        treble: EqBandSetting.init(frequency: 5500.0, Q: 0.7, gain: -4.0))
}


// In the view controller file create instance of EqPreset

let eqPreset = EqPreset()

let selectedPreset = eqPreset.warmer  // assigning the "warmer" preset

