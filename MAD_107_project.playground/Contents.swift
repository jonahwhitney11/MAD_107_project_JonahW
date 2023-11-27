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
    var milkConsumed: Float = 0
    
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
    
    // methods for displaying different events by date
    func displayDiaperChange(month: String, date: Int) {
        for event in dirtyDiapers {
            if month == event[0] as! String && date == event[1] as! Int {
                if event[2] as! Int > 12 && (event[2] as! Int) < 24 {
                    print("Dirty diaper on \(month) \(date). \(name) went number \(event[3]) at \(event[2] as! Int - 12)PM.")
                } else if (event[2] as! Int) < 12 {
                    print("Dirty diaper on \(month) \(date). \(name) went number \(event[3]) at \(event[2])AM.")
                } else if (event[2] as! Int) == 12 {
                    print("Dirty diaper on \(month) \(date). \(name) went number \(event[3]) at \(event[2])PM.")
                } else {
                    print("Dirty diaper on \(month) \(date). \(name) went number \(event[3]) at \(event[2] as! Int - 12)AM.")
                }
            }
        }
    }
    
    func displayFeed(month: String, date: Int) {
        for event in feeding {
            if month == event[0] as! String && date == event[1] as! Int {
                if event[2] as! Int > 12 && (event[2] as! Int) < 24 {
                    print("Feeding on \(month) \(date), \(name) consumed \(event[3]) ounces of milk at \(event[2] as! Int - 12)PM.")
                } else if (event[2] as! Int) < 12 {
                    print("Feeding on \(month) \(date), \(name) consumed \(event[3]) ounces of milk at \(event[2])AM.")
                } else if (event[2] as! Int) == 12 {
                    print("Feeding on \(month) \(date), \(name) consumed \(event[3]) ounces of milk at \(event[2])PM.")
                } else {
                    print("Feeding on \(month) \(date), \(name) consumed \(event[3]) ounces of milk at \(event[2] as! Int - 12)AM.")
                }
            }
        }
    }
    
    func displayTummyTime(month: String, date: Int) {
        for event in tummyTime {
            if month == event[0] as! String && date == event[1] as! Int {
                if event[2] as! Int > 12 && (event[2] as! Int) < 24 {
                    print("Tummy time on \(month) \(date), \(name) played on their tummy at \(event[2] as! Int - 12)PM for \(event[3]) hours.")
                } else if (event[2] as! Int) < 12 {
                    print("Tummy time on \(month) \(date), \(name) played on their tummy at \(event[2])AM for \(event[3]) hours.")
                } else if (event[2] as! Int) == 12 {
                    print("Tummy time on \(month) \(date), \(name) played on their tummy at \(event[2])PM for \(event[3]) hours.")
                } else {
                    print("Tummy time on \(month) \(date), \(name) played on their tummy at \(event[2] as! Int - 12)AM for \(event[3]) hours.")
                }
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
                if event[2] as! Int > 12 && (event[2] as! Int) < 24 {
                    print("\(name) napped on \(month) \(date) at \(event[2] as! Int - 12)PM for \(event[3]) hours.")
                } else if (event[2] as! Int) < 12 {
                    print("\(name) napped on \(month) \(date) at \(event[2])AM for \(event[3]) hours.")
                } else if (event[2] as! Int) == 12 {
                    print("\(name) napped on \(month) \(date) at \(event[2])PM for \(event[3]) hours.")
                } else {
                    print("\(name) napped on \(month) \(date) at \(event[2] as! Int - 12)AM for \(event[3]) hours.")
                }
            }
        }
    }
    
    func displayEvents(month: String, date: Int) {
        for event in events {
            if "\(month) \(date)" == "\(event[1]) \(event[2])" && eventTypes.dirtyDiaper.rawValue == event[0] as! String {
                if event[3] as! Int > 12 && (event[3] as! Int) < 24 {
                    print("\(eventTypes.dirtyDiaper.rawValue) on \(month) \(date), \(name) went number \(event[4]) at \(event[3] as! Int - 12)PM.")
                } else if (event[3] as! Int) < 12 {
                    print("\(eventTypes.dirtyDiaper.rawValue) on \(month) \(date), \(name) went number \(event[4]) at \(event[3])AM.")
                } else if (event[3] as! Int) == 12 {
                    print("\(eventTypes.dirtyDiaper.rawValue) on \(month) \(date), \(name) went number \(event[4]) at \(event[3])PM.")
                } else {
                    print("\(eventTypes.dirtyDiaper.rawValue) on \(month) \(date), \(name) went number \(event[4]) at \(event[3] as! Int - 12)AM.")
                }
            } else if "\(month) \(date)" == "\(event[1]) \(event[2])" && eventTypes.feeding.rawValue == event[0] as! String {
                if event[3] as! Int > 12 && (event[3] as! Int) < 24 {
                    print("\(eventTypes.feeding.rawValue) on \(month) \(date), \(name) consumed \(event[4]) ounces of milk at \(event[3] as! Int - 12)PM.")
                } else if (event[3] as! Int) < 12 {
                    print("\(eventTypes.feeding.rawValue) on \(month) \(date), \(name) consumed \(event[4]) ounces of milk at \(event[3])AM.")
                } else if (event[3] as! Int) == 12 {
                    print("\(eventTypes.feeding.rawValue) on \(month) \(date), \(name) consumed \(event[4]) ounces of milk at \(event[3])PM.")
                } else {
                    print("\(eventTypes.feeding.rawValue) on \(month) \(date), \(name) consumed \(event[4]) ounces of milk at \(event[3] as! Int - 12)AM.")
                }
            } else if "\(month) \(date)" == "\(event[1]) \(event[2])" && eventTypes.tummyTime.rawValue == event[0] as! String {
                if event[3] as! Int > 12 && (event[3] as! Int) < 24 {
                    print("\(eventTypes.tummyTime.rawValue) on \(month) \(date), \(name) played on their tummy at \(event[3] as! Int - 12)PM for \(event[4]) hours.")
                } else if (event[3] as! Int) < 12 {
                    print("\(eventTypes.tummyTime.rawValue) on \(month) \(date), \(name) played on their tummy at \(event[3])AM for \(event[4]) hours.")
                } else if (event[3] as! Int) == 12 {
                    print("\(eventTypes.tummyTime.rawValue) on \(month) \(date), \(name) played on their tummy at \(event[3])PM for \(event[4]) hours.")
                } else {
                    print("\(eventTypes.tummyTime.rawValue) on \(month) \(date), \(name) played on their tummy at \(event[3] as! Int - 12)AM for \(event[4]) hours.")
                }
            } else if "\(month) \(date)" == "\(event[1]) \(event[2])" && eventTypes.nap.rawValue == event[0] as! String {
                if event[3] as! Int > 12 && (event[3] as! Int) < 24 {
                    print("\(name) napped on \(month) \(date) at \(event[3] as! Int - 12)PM for \(event[4]) hours.")
                } else if (event[3] as! Int) < 12 {
                    print("\(name) napped on \(month) \(date) at \(event[3])AM for \(event[4]) hours.")
                } else if (event[3] as! Int) == 12 {
                    print("\(name) napped on \(month) \(date) at \(event[3])PM for \(event[4]) hours.")
                } else {
                    print("\(name) napped on \(month) \(date) at \(event[3] as! Int - 12)AM for \(event[4]) hours.")
                }
            } else if "\(month) \(date)" == "\(event[1]) \(event[2])" && eventTypes.sleep.rawValue == event[0] as! String {
                print("\(eventTypes.sleep.rawValue) on \(month) \(date), \(name) slept for \(event[3]) hours.")
            }
        }
    }
    
    // method for calculating total instances of different diaper changes on a given day
    func totalDirtyDiapersDay(month: String, date: Int) {
        // iterate over dirtyDiapers array
        for diaper in dirtyDiapers {
            // check if the month and date inside the diaper array inside of the dirtyDiapers array matches the given date
            if "\(diaper[0]) \(diaper[1])" == "\(month) \(date)" {
                // if the diaper is a 1, inriment wet diapers by 1.
                if diaper[3] as! Int == 1 {
                    wet += 1
                } else {
                    // if the diaper wasn't a 1, then it has to be 2, so incriment number2 by 1.
                    number2 += 1
                }
            }
        }
        // display message stating how many of each diaper type occured on the given day.
        print("\(name) had \(wet) wet diapers and \(number2) poopy diapers on \(month) \(date).")
    }
    
    // method for calculating total milk consummed on a given day
    func totalFeedingsDay(month: String, date: Int) {
        // iterate over feeding array
        for feed in feeding {
            // check if the month and date of the diaper array matches the given month and date
            if "\(feed[0]) \(feed[1])" == "\(month) \(date)" {
                // if it does then add the amount that was consumed during that feed to milkConsumed
                milkConsumed += feed[3] as! Float
            }
        }
        // display message stating how much milk was consumed on the given day
        print("\(name) consumed \(milkConsumed) ounces of milk on \(month) \(date).")
    }
    
    // method for calculating total tummy time on a given day
    func totalTummyTimeDay(month: String, date: Int) {
        // iterate over tummyTime array
        for tummyEvent in tummyTime {
            // check if the month and date of current tummyEvent matches the given month and date
            if "\(tummyEvent[0]) \(tummyEvent[1])" == "\(month) \(date)" {
                // if it does then add the time on time from that tummyEvent to timeOnTummy
                timeOnTummy += tummyEvent[3] as! Float
            }
        }
        // display messaging stating how much time baby spent on their tummy on the given date
        print("\(name) spend \(timeOnTummy) hours on their tummy on \(month) \(date).")
    }
    
    // method for calculating total nap times on a given day
    func totalNapsDay(month: String, date: Int) {
        // iterate over naps array
        for nap in naps {
            // check if the month and date of the current nap matches the given month and date
            if "\(nap[0]) \(nap[1])" == "\(month) \(date)" {
                // if it does then add the duration of the nap to napTime
                napTime += nap[3] as! Float
            }
        }
        // display message stating how much the baby napped on that day
        print("\(name) napped for a total of \(napTime) hours on \(month) \(date).")
    }
    
    // method for calculate averages of dirty diapers over the course of a week
    func dirtyDiaperAverages(month: String, startDate: Int) {
        // variables for calculating averages
        // current date is for incrimenting from the start date
        var currentDate = startDate
        // averageWet and number2Average start at 0, but will later be used to calculate the average per day over the course of the week
        var averageWet = 0
        var number2Average = 0
        
        // while loop to keep track of dates for the week
        while currentDate <= startDate + 7 {
            // iterate over dirtyDiapers array
            for diaper in dirtyDiapers {
                if "\(diaper[0]) \(diaper[1])" == "\(month) \(startDate)" {
                    // if the diaper is a 1, inriment wet diapers by 1.
                    if diaper[3] as! Int == 1 {
                        wet += 1
                    } else {
                        // if the diaper wasn't a 1, then it has to be 2, so incriment number2 by 1.
                        number2 += 1
                    }
                }
            }
            // incriment currentDate to the next date
            currentDate += 1
        }
        // calculating the averages of each type of diaper change for the week
        averageWet = wet / 7
        number2Average = number2 / 7
        // display statement showing averages of each type of diaper change for the week
        print("\(name) went number 1 \(averageWet) times per day, and number 2 \(number2Average) times per day this week.")
    }
}

// instance of baby class
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

quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 19, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 19, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 19, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 19, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 19, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 19, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 19, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 19, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 19, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 19, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 19, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 19, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 19, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 19, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 19, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 19, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 19, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 19, time: 20, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 19, time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 20, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 20, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 20, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 20, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 20, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 20, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 20, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 20, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 20, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 20, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 20, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 20, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 20, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 20, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 20, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 20, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 20, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 20, time: 20, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 20, time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 21, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 21, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 21, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 21, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 21, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 21, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 21, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 21, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 21, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 21, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 21, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 21, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 21, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 21, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 21, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 21, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 21, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 21, time: 20, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 21, time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 22, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 22, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 22, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 22, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 22, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 22, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 22, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 22, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 22, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 22, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 22, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 22, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 22, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 22, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 22, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 22, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 22, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 20, time: 22, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 22, time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 23, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 23, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 23, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 23, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 23, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 23, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 23, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 23, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 23, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 23, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 23, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 23, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 23, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 23, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 23, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 23, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 23, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 23, time: 20, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 23, time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 24, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 24, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 24, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 24, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 24, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 24, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 24, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 24, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 24, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 24, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 24, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 24, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 24, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 24, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 24, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 24, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 24, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 24, time: 20, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 24, time: 21, oneOrTwo: 1)

quinn.addOvernightSleep(month: Baby.months.October.rawValue, date: 25, timeAsleep: 9.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 25, time: 7, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 25, time: 7, amount: 3.25)
quinn.addNap(month: Baby.months.October.rawValue, date: 25, time: 8, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 25, time: 9, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 25, time: 9, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 25, time: 10, timeOnTummy: 0.25)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 25, time: 11, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 25, time: 11, amount: 3)
quinn.addNap(month: Baby.months.October.rawValue, date: 25, time: 12, napLength: 2)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 25, time: 14, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 25, time: 14, amount: 3.5)
quinn.addTummyEvent(month: Baby.months.October.rawValue, date: 25, time: 15, timeOnTummy: 0.5)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 25, time: 16, oneOrTwo: 1)
quinn.addFeed(month: Baby.months.October.rawValue, date: 25, time: 17, amount: 2.5)
quinn.addNap(month: Baby.months.October.rawValue, date: 25, time: 17, napLength: 0.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 25, time: 18, oneOrTwo: 2)
quinn.addFeed(month: Baby.months.October.rawValue, date: 25, time: 20, amount: 3.75)
quinn.addDiaperChange(month: Baby.months.October.rawValue, date: 25, time: 21, oneOrTwo: 1)
                
// testing that each event was added to events array, as well as the appropriate event type arrays
// print(quinn.events)
print(quinn.dirtyDiapers)
// print(quinn.feeding)
// print(quinn.naps)
// print(quinn.tummyTime)
// print(quinn.sleep)

// testing displayEvent method
// quinn.displayDiaperChange(month: Baby.months.October.rawValue, date: 18)
// quinn.displayFeed(month: Baby.months.October.rawValue, date: 18)
// quinn.displayTummyTime(month: Baby.months.October.rawValue, date: 18)
// quinn.displayOvernightSleep(month: Baby.months.October.rawValue, date: 18)
// quinn.displayNaps(month: Baby.months.October.rawValue, date: 18)
// quinn.displayEvents(month: Baby.months.October.rawValue, date: 18)


// testing methods that calculate totals of event types
// quinn.totalDirtyDiapersDay(month: Baby.months.October.rawValue, date: 18)
// quinn.totalFeedingsDay(month: Baby.months.October.rawValue, date: 18)
// quinn.totalTummyTimeDay(month: Baby.months.October.rawValue, date: 18)
// quinn.totalNapsDay(month: Baby.months.October.rawValue, date: 18)

// testing methods that calculate averages for week of different events
quinn.dirtyDiaperAverages(month: Baby.months.October.rawValue, startDate: 18)
