import UIKit

// CLass for baby

class Baby {
    
    // variables within class for name/gender
    var name: String
    var gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
    
    // variable for storing instances of all events
    var events: [[Any]] = []
    
    // variables for instances of different events
    var dirtyDiapers: [[Any]] = []
    var feeding: [[Any]] = []
    var sleep: [[Any]] = []
    var naps: [[Any]] = []
    var tummyTime: [[Any]] = []
    
    // variables for counting instances of different diaper changes
    var wet = 0
    var number2 = 0
    
    // variables for counting overnight sleep, naps, and tummy time.
    var overnightSleep: Float = 0
    var napTime: Float = 0
    var timeOnTummy: Float = 0
    
    // variable for milk consumption
    var milkConsumed = 0
    
    // method to add diaper change to dirtyDiapers array and events array
    func addDiaperChange(date: String, time: Int, oneOrTwo: Int) {
        
        dirtyDiapers.append([date, time, oneOrTwo])
        
        events.append(["Dirty Diaper", date, time, oneOrTwo])
        
        print("Dirty Diaper event successfully logged.")
    }
    
    // method for adding feeding event to array
    func addFeed(date: String, time: Int, amount: Float) {
        
        feeding.append([date, time, amount])
        
        events.append(["Feeding", date, time, amount])
        
        print("Feeding event successfully logged.")
    }
    
    // method for adding tummy time event to tummyTime array and events array
    func addTummyEvent(date: String, time: Int, timeOnTummy: Float) {
        
        tummyTime.append([date, time, timeOnTummy])
        
        events.append(["Tummy Time", date, time, timeOnTummy])
        
        print("Tummy Time event successfully logged.")
    }
    
    // method for adding overnight sleep to sleep and events arrays
    func addOvernightSleep(date: String, timeAsleep: Float) {
        
        sleep.append([date, timeAsleep])
        
        events.append(["Overnight Sleep", date, timeAsleep])
        
        print("Overnight Sleep event successfully logged.")
    }
    
    // method for adding naps to nap array and events array
    func addNap(date: String, time: Int, napLength: Float) {
        
        naps.append([date, time, napLength])
        
        events.append(["Nap", date, time, napLength])
        
        print("Nap event successfully logged.")
    }
}

var quinn = Baby(name: "Quinn", gender: "Female")

// testing methods adding different events to appropriate arrays
quinn.addDiaperChange(date: "Octover 18", time: 9, oneOrTwo: 1)
quinn.addDiaperChange(date: "Octover 18", time: 11, oneOrTwo: 1)
quinn.addDiaperChange(date: "October 18", time: 14, oneOrTwo: 2)
quinn.addDiaperChange(date: "Octover 18", time: 16, oneOrTwo: 1)
quinn.addDiaperChange(date: "Octover 18", time: 18, oneOrTwo: 2)
quinn.addDiaperChange(date: "October 23", time: 9, oneOrTwo: 1)
quinn.addDiaperChange(date: "October 23", time: 11, oneOrTwo: 2)
quinn.addDiaperChange(date: "October 23", time: 13, oneOrTwo: 1)
quinn.addDiaperChange(date: "October 23", time: 16, oneOrTwo: 2)


print(quinn.events) // testing that different events were added to events array
