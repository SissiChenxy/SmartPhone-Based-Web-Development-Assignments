import UIKit

//swift class
class Employee{
    var name: String
    var age: Int?
    var gender: Int?
    init(name: String) {
        self.name = name
    }
}

class Clerk:Employee {
    
}

let Manager = Clerk(name: "Manager")
var emp1 = Employee(name: "emp1")
let emp2 = emp1
emp1.name = "reemp1"
print("name of emp1 is \(emp1.name)")
print("name of emp2 is \(emp2.name)")

//enum
enum Day {
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

func dayType(day:Day){
    switch day {
    case .Sunday,.Saturday:
        print("Weekend")
    case .Monday,.Tuesday,.Wednesday,.Thursday,.Friday:
        print("Weekday")
    }
}
var day = Day.Sunday
dayType(day: day)

//Structures
struct Point{
    var x: Int
    var y: Int
}

var point1 = Point(x: 0, y: 0 )
let point2 = point1
point1.x = 3
print("x of point1 is \(point1.x)")
print("x of point2 is \(point2.x)")

//Protocols
protocol Animal {
    var legs: Int { get set }
    var hands: Int { get set }
    
    func Legs() -> String
    func Hands() -> String
}
class Kangaroo:Animal{
    var legs = 2
    var hands = 2
    func Legs() -> String {
        return "The legs of kangaroo is \(legs)"
    }
    func Hands() -> String {
        return "The hands of kangaroo is \(hands)"
    }
}
let kangaroo = Kangaroo()
print(kangaroo.Hands())
print(kangaroo.Legs())

//Extensions
extension Double {
    var add: Double {return self + 100 }
    var sub: Double { return self - 100 }
    var mul: Double { return self * 100 }
    var div: Double { return self / 100 }
}
let cal1:Double = 3.add
print(cal1)

struct Circle{
    var radius : Double
    init(radius:Double) {
        self.radius = radius
    }
}
extension Circle{
    func areaOfCircle() -> Double {
        let area = radius * radius * Double.pi
        return area
    }
}
var c = Circle(radius: 3)
c.areaOfCircle()


