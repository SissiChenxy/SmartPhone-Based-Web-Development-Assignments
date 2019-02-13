import UIKit

//Swift Variables
let constant = 25;
var explicit:Int = 15;
var implicit = 10;
print(explicit+implicit);
var a = 12, b = 5.5;
var product = Double(a)*b;
var iosStr:String = "iOS";
iosStr.append("Development");
var 📱 = "iPhone";
var 📲 = "iPhone\u{301}";
var equal = 📱==📲;

//Swift Arrays
var emptyArray = [Int]();
var stringArray = [String]();
stringArray = ["a","b","c"];
stringArray.append(contentsOf: ["String 4","String 5"]);
stringArray[2] = "Random";
var array:[Any] = [12 , "PewDiePie" , true , 176.224 , "J"];
array.remove(at: 3);

//Swift Loops
var intArray = [Int]();
for i in 1...100 {
    var tot = 0;
    for x in 1...i {
        if(i%x==0){
            tot = tot + 1;
        }
    }
    if(tot <= 2){
        intArray.append(i);
    }
}
print(intArray)

for index in 0...intArray.count-1 {
    var number = intArray[index];
    print("number is \(number)");
    var sum = 0;
    while(number > 0){
        sum = sum + number % 10;
        number = number / 10;
    }
    print("sum is \(sum)");
    
    var i = 0;
    repeat {
        intArray[index] = intArray[index] + 5;
        i = i + 1;
    } while i < intArray.count;
}
print(intArray)


let string = "Hello";
let characters:[Character] = Array(string);

for (index, item) in characters.enumerated(){
    print("character is \(item) and indice is \(index)");
}

//Swift Functions
func add(num1: Double,num2: Double) -> Double {
    return num1 + num2;
}

func subtract(num1: Int,num2: Int) -> Int {
    return num1 - num2;
}

func multiply(num1: Float ,num2: Float ) -> Float  {
    return num1 * num2;
}

assert(add(num1:26,num2:13) == 39, "Add function works!")
assert(subtract(num1: 78, num2: 25) == 53, "Substract function works!")
assert(multiply(num1: 2.5, num2: 3.3) == 8.25, "Multiply function works!")

//Conditions
func grade(input: Int) {
    switch input {
    case 0...25  :
        print("F")
    case 25...45  :
        print("E")
    case 45...50  :
        print("D")
    case 50...60  :
        print("C")
    case 60...80  :
        print("B")
    case 80...100 :
        print("A")
    default :
        print( "default")
    }
}
grade(input:73)

func shape(length:Int,breadth:Int) -> String{
    var shape:String = ""
    let equal:Bool = length == breadth
    switch equal {
    case false:
        shape = "Rectangular"
    case true :
        shape = "Square"
    }
    return shape
}
shape(length: 26, breadth: 59)
shape(length: 33, breadth: 33)

//Swift Dictionary and Tuples
var userDict = [Int: String]()
userDict = [1:"Nancy",2:"Bob",3:"Dave",4:"Susan",5:"Lily"]
for entry in userDict {
    print("key is \(entry.key), value is \(entry.value)")
}
print("keys are \(userDict.keys)")

var MyTuple:(String?, String?)
MyTuple = ("OK", "true")
print("the first string is \(MyTuple.0!) and the second string is \(MyTuple.1!)")

//Swift Optionals
let optvar :Int? = nil
let unwrapme : String? = nil
if let unwrappedValue : String = unwrapme {
    print(unwrappedValue)
}else{
    print("nil")
}

var age:Optional<Int>
age = Optional(18)

var value1 : Int?
var defaultValue : Int = 7
if value1 != nil {
    print(value1!)
}else{
    print(defaultValue)
}
print(value1 ?? defaultValue);

func sendToServer(name:String,address:String){
    print("Send to Server successfully!")
}

func send(txtname:String?,txtaddress:String?){
    guard let name = txtname else {
        print ("No name provided")
        return
    }
    guard let address = txtaddress else{
        print("No address provided")
        return
    }
    sendToServer(name:name , address:address)
}
send(txtname:nil,txtaddress:"apt 1")
send(txtname:"Lucy",txtaddress:nil)
send(txtname:"Amy",txtaddress:"50 Station")







