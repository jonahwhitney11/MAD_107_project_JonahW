import UIKit

// CLass for baby

class Baby {
    
    // variables within class for name/gender
    let name: String
    let gender: String
    
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
    
    // enum with months
    enum months {
        case January, February, March, April, May, June, July, August, September, October, November, December
    }
    
    enum eventTypes: String {
        case dirtyDiaper = "Dirty diaper"
        case feeding = "Feeding"
        case sleep = "Overnight sleep"
        case nap = "Nap"
        case tummyTime = "Tummy time"
    }
    
    // method to add diaper change to dirtyDiapers array and events array
    func addDiaperChange(date: String, time: Int, oneOrTwo: Int) {
        
        dirtyDiapers.append([date, time, oneOrTwo])
        
        events.append([eventTypes.dirtyDiaper.rawValue, date, time, oneOrTwo])
        
        print("\(eventTypes.dirtyDiaper.rawValue) event successfully logged.")
    }
    
    // method for adding feeding event to array
    func addFeed(date: String, time: Int, amount: Float) {
        
        feeding.append([date, time, amount])
        
        events.append([eventTypes.feeding.rawValue, date, time, amount])
        
        print("\(eventTypes.feeding.rawValue) event successfully logged.")
    }
    
    // method for adding tummy time event to tummyTime array and events array
    func addTummyEvent(date: String, time: Int, timeOnTummy: Float) {
        
        tummyTime.append([date, time, timeOnTummy])
        
        events.append([eventTypes.tummyTime.rawValue, date, time, timeOnTummy])
        
        print("\(eventTypes.tummyTime.rawValue) event successfully logged.")
    }
    
    // method for adding overnight sleep to sleep and events arrays
    func addOvernightSleep(date: String, timeAsleep: Float) {
        
        sleep.append([date, timeAsleep])
        
        events.append([eventTypes.sleep.rawValue, date, timeAsleep])
        
        print("\(eventTypes.sleep.rawValue) event successfully logged.")
    }
    
    // method for adding naps to nap array and events array
    func addNap(date: String, time: Int, napLength: Float) {
        
        naps.append([date, time, napLength])
        
        events.append([eventTypes.nap.rawValue, date, time, napLength])
        
        print("\(eventTypes.nap.rawValue) event successfully logged.")
    }
    
    func displayDiaperChange(date: String) {
        for event in dirtyDiapers {
            if date == event[0] as! String {
                print("Dirty diaper on \(date). \(name) went number \(event[2]) at \(event[1]).")
            }
        }
    }
    
    func displayFeed(date: String) {
        for event in feeding {
            if date == event[0] as! String {
                print("Feeding on \(date), \(name) consumed \(event[2] as! Float) ounces of milk at \(event[1] as! Int).")
            }
        }
    }
    
    func displayTummyTime(date: String) {
        for event in tummyTime {
            if date == event[0] as! String {
                print("Tummy time on \(date), \(name) played on their tummy at \(event[1] as! Int) for \(event[2] as! Float) hours.")
            }
        }
    }
    
    func displayOvernightSleep(date: String) {
        for event in sleep {
            if date == event[0] as! String {
                print("\(name) slept for \(event[1]) hours overnight on \(date).")
            }
        }
    }
    
    func displayNaps(date: String) {
        for event in naps {
            if date == event[0] as! String {
                print("\(name) napped on \(date) at \(event[1]) for \(event[2]) hours.")
            }
        }
    }
    
    func displayEvents(date: String) {
        for event in events {
            if date == event[1] as! String && event[0] as! String == eventTypes.dirtyDiaper.rawValue {
                print("Dirty diaper on \(date). \(name) went number \(event[3]) at \(event[2]).")
            } else if date == event[1] as! String && event[0] as! String == eventTypes.feeding.rawValue {
                print("Feeding on \(date), \(name) consumed \(event[3]) ounces of milk at \(event[2]).")
            } else if date == event[1] as! String && event[0] as! String == eventTypes.tummyTime.rawValue {
                print("Tummy time on \(date), \(name) played on their tummy at \(event[2]) for \(event[3]) hours.")
            } else if date == event[1] as! String && event[0] as! String == eventTypes.sleep.rawValue {
                print("\(name) slept for \(event[2]) hours overnight on \(date).")
            } else if date == event[1] as! String && event[0] as! String == eventTypes.nap.rawValue {
                print("\(name) napped on \(date) at \(event[2]) for \(event[3]) hours.")
            }
        }
    }
}

var quinn = Baby(name: "Quinn", gender: "Female")

// testing methods adding different events to appropriate arrays
quinn.addOvernightSleep(date: "October 18", timeAsleep: 9.75)
quinn.addDiaperChange(date: "October 18", time: 7, oneOrTwo: 1)
quinn.addFeed(date: "October 18", time: 7, amount: 3.25)
quinn.addNap(date: "October 18", time: 8, napLength: 0.75)
quinn.addDiaperChange(date: "October 18", time: 9, oneOrTwo: 1)
quinn.addFeed(date: "October 18", time: 9, amount: 3.5)
quinn.addTummyEvent(date: "October 18", time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(date: "October 18", time: 11, oneOrTwo: 1)
quinn.addFeed(date: "October 18", time: 11, amount: 3)
quinn.addNap(date: "October 18", time: 12, napLength: 2)
quinn.addDiaperChange(date: "October 18", time: 14, oneOrTwo: 2)
quinn.addFeed(date: "October 18", time: 14, amount: 3.5)
quinn.addTummyEvent(date: "October 18", time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(date: "October 18", time: 16, oneOrTwo: 1)
quinn.addFeed(date: "October 18", time: 17, amount: 2.5)
quinn.addNap(date: "October 18", time: 17, napLength: 0.75)
quinn.addDiaperChange(date: "October 18", time: 18, oneOrTwo: 2)
quinn.addFeed(date: "October 18", time: 20, amount: 3.75)
quinn.addDiaperChange(date: "October 18", time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(date: "October 19", timeAsleep: 9.75)
quinn.addDiaperChange(date: "October 19", time: 7, oneOrTwo: 1)
quinn.addFeed(date: "October 19", time: 7, amount: 3.25)
quinn.addNap(date: "October 19", time: 8, napLength: 0.75)
quinn.addDiaperChange(date: "October 19", time: 9, oneOrTwo: 1)
quinn.addFeed(date: "October 19", time: 9, amount: 3.5)
quinn.addTummyEvent(date: "October 19", time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(date: "October 19", time: 11, oneOrTwo: 1)
quinn.addFeed(date: "October 19", time: 11, amount: 3)
quinn.addNap(date: "October 19", time: 12, napLength: 2)
quinn.addDiaperChange(date: "October 19", time: 14, oneOrTwo: 2)
quinn.addFeed(date: "October 19", time: 14, amount: 3.5)
quinn.addTummyEvent(date: "October 19", time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(date: "October 19", time: 16, oneOrTwo: 1)
quinn.addFeed(date: "October 19", time: 17, amount: 2.5)
quinn.addNap(date: "October 19", time: 17, napLength: 0.75)
quinn.addDiaperChange(date: "October 19", time: 18, oneOrTwo: 2)
quinn.addFeed(date: "October 19", time: 20, amount: 3.75)
quinn.addDiaperChange(date: "October 19", time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(date: "October 20", timeAsleep: 9.75)
quinn.addDiaperChange(date: "October 20", time: 7, oneOrTwo: 1)
quinn.addFeed(date: "October 20", time: 7, amount: 3.25)
quinn.addNap(date: "October 20", time: 8, napLength: 0.75)
quinn.addDiaperChange(date: "October 20", time: 9, oneOrTwo: 1)
quinn.addFeed(date: "October 20", time: 9, amount: 3.5)
quinn.addTummyEvent(date: "October 20", time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(date: "October 20", time: 11, oneOrTwo: 1)
quinn.addFeed(date: "October 20", time: 11, amount: 3)
quinn.addNap(date: "October 20", time: 12, napLength: 2)
quinn.addDiaperChange(date: "October 20", time: 14, oneOrTwo: 2)
quinn.addFeed(date: "October 20", time: 14, amount: 3.5)
quinn.addTummyEvent(date: "October 20", time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(date: "October 20", time: 16, oneOrTwo: 1)
quinn.addFeed(date: "October 20", time: 17, amount: 2.5)
quinn.addNap(date: "October 20", time: 17, napLength: 0.75)
quinn.addDiaperChange(date: "October 20", time: 18, oneOrTwo: 2)
quinn.addFeed(date: "October 20", time: 20, amount: 3.75)
quinn.addDiaperChange(date: "October 20", time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(date: "October 21", timeAsleep: 9.75)
quinn.addDiaperChange(date: "October 21", time: 7, oneOrTwo: 1)
quinn.addFeed(date: "October 21", time: 7, amount: 3.25)
quinn.addNap(date: "October 21", time: 8, napLength: 0.75)
quinn.addDiaperChange(date: "October 21", time: 9, oneOrTwo: 1)
quinn.addFeed(date: "October 21", time: 9, amount: 3.5)
quinn.addTummyEvent(date: "October 21", time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(date: "October 21", time: 11, oneOrTwo: 1)
quinn.addFeed(date: "October 21", time: 11, amount: 3)
quinn.addNap(date: "October 21", time: 12, napLength: 2)
quinn.addDiaperChange(date: "October 21", time: 14, oneOrTwo: 2)
quinn.addFeed(date: "October 21", time: 14, amount: 3.5)
quinn.addTummyEvent(date: "October 21", time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(date: "October 21", time: 16, oneOrTwo: 1)
quinn.addFeed(date: "October 21", time: 17, amount: 2.5)
quinn.addNap(date: "October 21", time: 17, napLength: 0.75)
quinn.addDiaperChange(date: "October 21", time: 18, oneOrTwo: 2)
quinn.addFeed(date: "October 21", time: 20, amount: 3.75)
quinn.addDiaperChange(date: "October 21", time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(date: "October 22", timeAsleep: 9.75)
quinn.addDiaperChange(date: "October 22", time: 7, oneOrTwo: 1)
quinn.addFeed(date: "October 22", time: 7, amount: 3.25)
quinn.addNap(date: "October 22", time: 8, napLength: 0.75)
quinn.addDiaperChange(date: "October 22", time: 9, oneOrTwo: 1)
quinn.addFeed(date: "October 22", time: 9, amount: 3.5)
quinn.addTummyEvent(date: "October 22", time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(date: "October 22", time: 11, oneOrTwo: 1)
quinn.addFeed(date: "October 22", time: 11, amount: 3)
quinn.addNap(date: "October 22", time: 12, napLength: 2)
quinn.addDiaperChange(date: "October 22", time: 14, oneOrTwo: 2)
quinn.addFeed(date: "October 22", time: 14, amount: 3.5)
quinn.addTummyEvent(date: "October 22", time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(date: "October 22", time: 16, oneOrTwo: 1)
quinn.addFeed(date: "October 22", time: 17, amount: 2.5)
quinn.addNap(date: "October 22", time: 17, napLength: 0.75)
quinn.addDiaperChange(date: "October 22", time: 18, oneOrTwo: 2)
quinn.addFeed(date: "October 22", time: 20, amount: 3.75)
quinn.addDiaperChange(date: "October 22", time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(date: "October 23", timeAsleep: 9.75)
quinn.addDiaperChange(date: "October 23", time: 7, oneOrTwo: 1)
quinn.addFeed(date: "October 23", time: 7, amount: 3.25)
quinn.addNap(date: "October 23", time: 8, napLength: 0.75)
quinn.addDiaperChange(date: "October 23", time: 9, oneOrTwo: 1)
quinn.addFeed(date: "October 23", time: 9, amount: 3.5)
quinn.addTummyEvent(date: "October 23", time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(date: "October 23", time: 11, oneOrTwo: 1)
quinn.addFeed(date: "October 23", time: 11, amount: 3)
quinn.addNap(date: "October 23", time: 12, napLength: 2)
quinn.addDiaperChange(date: "October 23", time: 14, oneOrTwo: 2)
quinn.addFeed(date: "October 23", time: 14, amount: 3.5)
quinn.addTummyEvent(date: "October 23", time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(date: "October 23", time: 16, oneOrTwo: 1)
quinn.addFeed(date: "October 23", time: 17, amount: 2.5)
quinn.addNap(date: "October 23", time: 17, napLength: 0.75)
quinn.addDiaperChange(date: "October 23", time: 18, oneOrTwo: 2)
quinn.addFeed(date: "October 23", time: 20, amount: 3.75)
quinn.addDiaperChange(date: "October 23", time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(date: "October 24", timeAsleep: 9.75)
quinn.addDiaperChange(date: "October 24", time: 7, oneOrTwo: 1)
quinn.addFeed(date: "October 24", time: 7, amount: 3.25)
quinn.addNap(date: "October 24", time: 8, napLength: 0.75)
quinn.addDiaperChange(date: "October 24", time: 9, oneOrTwo: 1)
quinn.addFeed(date: "October 24", time: 9, amount: 3.5)
quinn.addTummyEvent(date: "October 24", time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(date: "Octover 24", time: 11, oneOrTwo: 1)
quinn.addFeed(date: "October 24", time: 11, amount: 3)
quinn.addNap(date: "October 24", time: 12, napLength: 2)
quinn.addDiaperChange(date: "October 24", time: 14, oneOrTwo: 2)
quinn.addFeed(date: "October 24", time: 14, amount: 3.5)
quinn.addTummyEvent(date: "October 24", time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(date: "October 24", time: 16, oneOrTwo: 1)
quinn.addFeed(date: "October 24", time: 17, amount: 2.5)
quinn.addNap(date: "October 24", time: 17, napLength: 0.75)
quinn.addDiaperChange(date: "October 24", time: 18, oneOrTwo: 2)
quinn.addFeed(date: "October 24", time: 20, amount: 3.75)
quinn.addDiaperChange(date: "October 24", time: 21, oneOrTwo: 1)

// testing that each event was added to events array, as well as the appropriate event type arrays
// print(quinn.events)
// print(quinn.dirtyDiapers)
// print(quinn.feeding)
// print(quinn.naps)
// print(quinn.tummyTime)
// print(quinn.sleep)

// testing displayEvent method
// quinn.displayDiaperChange(date: "October 18")
// quinn.displayFeed(date: "October 18")
// quinn.displayTummyTime(date: "October 18")
// quinn.displayOvernightSleep(date: "October 18")
// quinn.displayNaps(date: "October 18")
quinn.displayEvents(date: "October 19")
