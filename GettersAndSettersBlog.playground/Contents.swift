// www.SwiftCodeComposer.com

// Getters and Setters Described Using Letters
// by Alistair Cooper

//***************************************************

import UIKit

// Computed Properties


class AudioFileData {
    
    var fileLength: Int = 0   // length in seconds
    var sampleRate: Int = 0   // sample rate in Hertz
    var wordLength: Int = 0   // word length in bits
    var channels: Int = 0     // number of audio channels
    
    init (fileLength: Int, sampleRate: Int, wordLength: Int, channels: Int) {
        self.fileLength = fileLength
        self.sampleRate = sampleRate
        self.wordLength = wordLength
        self.channels = channels
    }
    
    var fileSize: Double {
        get {
            return Double(fileLength * sampleRate * wordLength * channels) / 8
        }
        set {
            self.fileLength = (Int)(newValue * 8) / (sampleRate * wordLength * channels)
        }
    }
}

let audioFile = AudioFileData(fileLength: 60, sampleRate: 44100, wordLength: 24, channels: 2)

audioFile.fileSize  // 15876000 bytes

// set the file length based on the file size

audioFile.fileSize = 31752000
audioFile.fileLength   // 120 seconds


//****************************

// Property Observers

let minimumBarNumber = -2

class BarCounter {
    
    var barNumber: Int = 0 {
        willSet(newBarNumber) {
            print("Playhead is about to move to bar \(newBarNumber)")
        }
        didSet {
            if barNumber > minimumBarNumber {
                print("Playhead moved to bar number: \(barNumber - oldValue)")
            } else {
                print("Playhead out of range")
                // handle error with code here
            }
            
        }
    }
}

// implementation

let barCounter = BarCounter()

barCounter.barNumber = 5

// Playhead is about to move to bar 5
// Playhead moved to bar number: 5

barCounter.barNumber = 21

// Playhead is about to move to bar 21
// Playhead moved to bar number: 16