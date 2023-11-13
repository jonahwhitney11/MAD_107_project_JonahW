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
    enum months: String {
        case January = "January", February, March, April, May, June, July, August, September, October, November, December
    }
    
    enum eventTypes: String {
        case dirtyDiaper = "Dirty diaper"
        case feeding = "Feeding"
        case sleep = "Overnight sleep"
        case nap = "Nap"
        case tummyTime = "Tummy time"
    }
    
    // method to add diaper change to dirtyDiapers array and events array
    func addDiaperChange(month: String, date: Int, time: Int, oneOrTwo: Int) {
        
        dirtyDiapers.append([month, date, time, oneOrTwo])
        
        events.append([eventTypes.dirtyDiaper.rawValue, month, date, time, oneOrTwo])
        
        print("\(eventTypes.dirtyDiaper.rawValue) event successfully logged.")
    }
    
    // method for adding feeding event to array
    func addFeed(month: String, date: Int, time: Int, amount: Float) {
        
        feeding.append([month, date, time, amount])
        
        events.append([eventTypes.feeding.rawValue, month, date, time, amount])
        
        print("\(eventTypes.feeding.rawValue) event successfully logged.")
    }
    
    // method for adding tummy time event to tummyTime array and events array
    func addTummyEvent(month: String, date: Int, time: Int, timeOnTummy: Float) {
        
        tummyTime.append([month, date, time, timeOnTummy])
        
        events.append([eventTypes.tummyTime.rawValue, month, date, time, timeOnTummy])
        
        print("\(eventTypes.tummyTime.rawValue) event successfully logged.")
    }
    
    // method for adding overnight sleep to sleep and events arrays
    func addOvernightSleep(month: String, date: Int, timeAsleep: Float) {
        
        sleep.append([month, date, timeAsleep])
        
        events.append([eventTypes.sleep.rawValue, month, date, timeAsleep])
        
        print("\(eventTypes.sleep.rawValue) event successfully logged.")
    }
    
    // method for adding naps to nap array and events array
    func addNap(month: String, date: Int, time: Int, napLength: Float) {
        
        naps.append([month, date, time, napLength])
        
        events.append([eventTypes.nap.rawValue, month, date, time, napLength])
        
        print("\(eventTypes.nap.rawValue) event successfully logged.")
    }
    
    func displayDiaperChange(month: String, date: Int) {
        for event in dirtyDiapers {
            if month == event[0] as! String && date == event[1] as! Int {
                print("Dirty diaper on \(month) \(date). \(name) went number \(event[3]) at \(event[2]).")
            }
        }
    }
    
    func displayFeed(month: String, date: Int) {
        for event in feeding {
            if month == event[0] as! String && date == event[1] as! Int {
                print("Feeding on \(month) \(date), \(name) consumed \(event[3]) ounces of milk at \(event[2]).")
            }
        }
    }
    
    func displayTummyTime(month: String, date: Int) {
        for event in tummyTime {
            if month == event[0] as! String && date == event[1] as! Int {
                print("Tummy time on \(month) \(date), \(name) played on their tummy at \(event[2]) for \(event[3]) hours.")
            }
        }
    }
    
    func displayOvernightSleep(month: String, date: Int) {
        for event in sleep {
            if month == event[0] as! String && date == event[1] as! Int {
                print("\(name) slept for \(event[2]) hours overnight on \(month) \(date).")
            }
        }
    }
    
    func displayNaps(month: String, date: Int) {
        for event in naps {
            if month == event[0] as! String && date == event[1] as! Int {
                print("\(name) napped on \(month) \(date) at \(event[2]) for \(event[3]) hours.")
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
quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 18, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 18, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 18, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 18, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 18, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 18, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 18, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 18, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 18, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 18, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 18, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 18, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 18, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 18, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 18, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 18, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 18, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 18, time: 20, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 18, time: 21, oneOrTwo: 1)

// testing that each event was added to events array, as well as the appropriate event type arrays
// print(quinn.events)
// print(quinn.dirtyDiapers)
// print(quinn.feeding)
// print(quinn.naps)
// print(quinn.tummyTime)
// print(quinn.sleep)

// testing displayEvent method
// quinn.displayDiaperChange(month: Baby.months.October.rawValue, date: 18)
// quinn.displayFeed(month: Baby.months.October.rawValue, date: 18)
// quinn.displayTummyTime(month: Baby.months.October.rawValue, date: 18)
// quinn.displayOvernightSleep(month: Baby.months.October.rawValue, date: 18)
quinn.displayNaps(month: Baby.months.October.rawValue, date: 18)
// quinn.displayEvents(date: "October 19")
