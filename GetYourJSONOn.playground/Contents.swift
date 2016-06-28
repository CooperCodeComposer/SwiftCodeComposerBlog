// www.SwiftCodeComposer.com

// Get Your JSON On
// by Alistair Cooper

//***************************************************

import Foundation


// Part 1 - make a new dictionary

var villain1: [String : AnyObject] = ["name" : "Jason Voorhees",
                                      "born" : 1945,
                                      "murder count" : 127,
                                      "likes" : ["hockey", "occasional Fridays"],
                                      "dislikes" : "water sports"]

// Some examples of working with a dictionary

villain1["name"]   // "Jason Voorhees"

villain1.count     // 5   (number of key value pairs in dictionary)

villain1.updateValue("traveling during Thanksgiving", forKey: "dislikes")



// Part 2 - create two more dictionaries

let villain2: [String : AnyObject] = ["name" : "Freddie Krueger",
                                      "born" : 1942,
                                      "murder count" : 35,
                                      "likes" : ["bed time", "knitwear"],
                                      "dislikes" : "barbecues"]

let villain3: [String : AnyObject] = ["name" : "Michael Myers",
                                      "born" : 1978,
                                      "murder count" : 94,
                                      "likes" : ["leaves changing color in the fall", "Austin Powers Movies"],
                                      "dislikes" : "Jamie Lee Curtis"]

// Add these dictionaries to an array of villains

var villainArray: [[String : AnyObject]] = [villain1, villain2, villain3]


// Part 3 - create JSON object and turn to string


var jsonData: NSData!

do {
    jsonData = try NSJSONSerialization.dataWithJSONObject(villainArray, options: .PrettyPrinted)
    
} catch let error as NSError {
    print(error)
}

let jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding)!
print(jsonString)



// Part 4 make JSON template
 
func makeJSONOutput() {
    var jsonArray: [[String:String]] = []
 
    var jsonNSData: NSData!
 
    let dict1: [String:String] = ["key1" : "value1",
                                  "key2" : "value2"]
 
    jsonArray.append(dict1)
 
    let dict2: [String:String] = ["key1" : "value1",
                                  "key2" : "value2"]
 
    jsonArray.append(dict2)
 
    // add more dictionaries here
    do {
        jsonNSData = try NSJSONSerialization.dataWithJSONObject(jsonArray, options: .PrettyPrinted)
    } catch let error as NSError {
        print(error)
    }
    
    let jsonString = String(data: jsonNSData, encoding: NSUTF8StringEncoding)!
    print(jsonString)
}
 
makeJSONOutput()







