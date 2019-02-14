//
//  main.swift
//  MovieRentalApplication
//
//  Created by 陈昕昀 on 2/11/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import Foundation

//class and struct statement
class Customer{
    var id: Int = customerId
    var name: String = ""
    var age: Int = 0
    var email: String = ""
    var address: String = ""
    static var customerId:Int = 1
    
    init(){}
    init(Name:String, Age: Int, Address:String, Email:String){
        Customer.customerId += 1
        self.name = Name
        self.age = Age
        self.email = Email
        self.address = Address
    }
}

enum MovieType{
    case Action
    case Adventure
    case Animation
    case Comedy
    case Crime
    case Documentary
    case Drama
    case Historical
    case Musical
    case Fiction
    case War
    case None
}

class Movie{
    var id: Int = movieId
    var name: String = ""
    var releaseYear: Int = 0
    var type: MovieType = MovieType.None
    var quantity: Int = 0
    static var movieId:Int = 1
    
    init(){}
    init(Name:String, ReleaseYear: Int, Type:MovieType, Quantity:Int){
        Movie.movieId += 1
        self.name = Name
        self.releaseYear = ReleaseYear
        self.type = Type
        self.quantity = Quantity
    }
}

var CustomerList: Array<Customer> = Array()
var MovieList: Array<Movie> = Array()

class Booking{
    var id: Int = bookingId
    var customer: Customer?
    var movie: Movie?
    var quantity: Int?
    var bookingDate: String?
    var returnDate: String?
    static var bookingId:Int = 1
    
    init(){}
    init(BookingDate:String,ReturnDate:String, Customer:Customer, Movie:Movie, Quantity:Int){
        Booking.bookingId += 1
        self.customer = Customer
        self.movie = Movie
        self.quantity = Quantity
        self.bookingDate = BookingDate
        self.returnDate = ReturnDate
    }
    
}

var BookingList : Array<Booking> = Array()

//function
func InitData(){
    let c1 = Customer(Name:"Sissi", Age:22 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"871513123@qq.com")
//    let c2 = Customer(Name:"Jesse", Address:"24 Westland Ave, Boston, MA, 02115", IdNumber:"185492341", phoneNumber: 234762891)
//    let c3 = Customer(Name:"Walt", Address:"32 Boylston Street, Boston, MA, 02115", IdNumber:"534351235", phoneNumber: 234764478)
//    let c4 = Customer(Name:"Tatoo", Address:"10 Brookline Ave, Boston, MA, 02115", IdNumber:"623245232", phoneNumber: 126374892)
//    let c5 = Customer(Name:"Walt", Address:"48 Westland Ave, Boston, MA, 02115", IdNumber:"693438238", phoneNumber: 263784567)
    CustomerList.append(c1)
//    CustomerList.append(c2)
//    CustomerList.append(c3)
//    CustomerList.append(c4)
//    CustomerList.append(c5)
//
    let m1 = Movie(Name:"Movie 1", ReleaseYear: 2013, Type:MovieType.Action, Quantity:20)
//    let m2 = Movie(Name:"Room 2", roomType:type.Double, price:320.0)
//    let m3 = Movie(Name:"Romm 3", roomType:type.Double, price:175.0)
//    let m4 = Movie(Name:"Room 4", roomType:type.Single, price:75.0)
//    let m5 = Movie(Name:"Room 5", roomType:type.Single, price:60.0)
    MovieList.append(m1)
//    MovieList.append(m2)
//    MovieList.append(m3)
//    MovieList.append(m4)
//    MovieList.append(m5)
}

func AddCustomer(){
    let customer = Customer()
    while(true){
        print("Name:")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Name cannot be empty!")
            continue
        }
        customer.name = name
        break
    }
    while(true){
        print("Age:")
        guard let age:String = readLine(),!age.isEmpty, Int(age) != nil else{
            print("Age cannot be empty!")
            continue
        }
        customer.age = Int(age)!
        break
    }
    while(true){
        print("Email:")
        guard let email:String = readLine(), !email.isEmpty else{
            print("Email cannot be empty!")
            continue
        }
        customer.email = email
        break
    }
    while(true){
        print("Address:")
        guard let address:String = readLine(), !address.isEmpty else{
            print("Address cannot be empty!")
            continue
        }
        customer.address = address
        break
    }
        CustomerList.append(customer)
        print("Customer: \(customer.name) created successfully!")
        DisplayAllCustomers()
}

func ExistedCustomer(name:String) -> Customer?{
    for Customer in CustomerList{
        if(Customer.name==name){
            return Customer
        }
    }
    return nil
}

func UpdateCustomer(){
    var name:String = ""
    var option:String = ""
    
    while(true){
        print("Please input the name of the customer you want to update: ")
        guard let nameStr:String = readLine(),!nameStr.isEmpty else{
            print("Name cannot be empty!")
            continue
        }
        if ExistedCustomer(name: nameStr) == nil {
            print("This Customer doesn't exist in system")
            continue
        }
        name = nameStr
        break
    }
    
    while(true){
        print("Please choose the number of which value you want to change: ")
        print("1. Name 2. Age 3. Email 4. Address")
        guard let optionStr:String = readLine(), !optionStr.isEmpty else{
            print("You need to choose a number")
            continue
        }
        option = optionStr
        
        for Customer in CustomerList{
            if(Customer.name==name){
                switch option{
                case "1":
                    print("Name: ")
                    guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                        print("Name cannot be empty!")
                        continue
                    }
                    Customer.name = nameStr
                    print("Customer's name changed to \(Customer.name) successfully!")
                case "2":
                    print("Age: ")
                    guard let ageStr:String = readLine(), !ageStr.isEmpty,Int(ageStr) != nil else{
                        print("Age cannot be empty!")
                        continue
                    }
                    Customer.age = Int(ageStr)!
                    print("Customer's age changed to \(Customer.age) successfully!")
                case "3":
                    print("Email: ")
                    guard let emailStr:String = readLine(), !emailStr.isEmpty else{
                        print("Email cannot be empty!")
                        continue
                    }
                    Customer.email = emailStr
                    print("Customer's email changed to \(Customer.email) successfully!")
                case "4":
                    print("Address: ")
                    guard let addressStr:String = readLine(), !addressStr.isEmpty else{
                        print("Address cannot be empty!")
                        continue
                    }
                    Customer.address = addressStr
                    print("Customer's address changed to \(Customer.address) successfully!")
                default:
                    print("The number you choose doesn't exist. Please follow the instruction")
                    continue
                }
              }
            }
        break
        }
    }

func DeleteCustomer(){
    while (true) {
        print("Please input the name of the customer who you want to delete")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Name cannot be empty!")
            continue
        }
        for Customer in CustomerList{
            if(Customer.name == name){
                CustomerList.remove(at:Customer.id-1)
                print("Customer \(Customer.name) is deleted successfully!")
            }else{
                print("Customer doesn't exist")
            }
        }
        DisplayAllCustomers()
        break
    }
}

func DisplayAllCustomers(){
    if(CustomerList.isEmpty){
        print("No Customer in the system now")
    }else{
        print("All Customers are here:")
        for Customer in CustomerList{
            print("Id: \(Customer.id), Name: \(Customer.name), Age: \(Customer.age), Email: \(Customer.email), Address: \(Customer.address)")
        }
    }
}

func AddMovie(){
    let m = Movie()
    while(true){
        print("Movie Name: ")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Movie name cannot be empty!")
            continue
        }
        m.name = name
        
        print("Release Year: ")
        guard let year:String = readLine(), !year.isEmpty,Int(year) != nil else{
            print("Release Year cannot be empty!")
            continue
        }
        m.releaseYear = Int(year)!
        
        print("Quantity: ")
        guard let quantity:String = readLine(), !quantity.isEmpty, Int(quantity) != nil else{
            print("Movie Quantity cannot be empty!")
            continue
        }
        m.quantity = Int(quantity)!
        chooseType(movie: m)
        MovieList.append(m)
        print("Movie created successfully!")
        ViewAllMovies()
        break
    }
}

func chooseType(movie:Movie){
    while(true){
        print("Movie Type: 1. Action 2. Adventure 3. Animation 4.Comedy 5. Crime 6. Documentary 7. Drama 8. Historical 9. Musical 10. Fiction 11. War")
        guard let type:String = readLine(), type=="1" || type=="2" || type=="3" || type=="4" || type=="5" || type=="6" || type=="7" || type=="8" || type=="9" || type=="10" || type=="11" else{
            print("Movie Type cannot be empty!")
            continue
        }
        if(type=="1"){
            movie.type = MovieType.Action
        }else if(type == "2"){
            movie.type = MovieType.Adventure
        }else if(type == "3"){
            movie.type = MovieType.Animation
        }else if(type == "4"){
            movie.type = MovieType.Comedy
        }else if(type == "5"){
            movie.type = MovieType.Crime
        }else if(type == "6"){
            movie.type = MovieType.Documentary
        }else if(type == "7"){
            movie.type = MovieType.Drama
        }else if(type == "8"){
            movie.type = MovieType.Historical
        }else if(type == "9"){
            movie.type = MovieType.Musical
        }else if(type == "10"){
            movie.type = MovieType.Fiction
        }else if(type == "11"){
            movie.type = MovieType.War
        }
    }
}

func UpdateMovieDetails(){
    while(true){
        print("Please input the name of the movie you want to update: ")
        guard let name:String = readLine(),!name.isEmpty else{
            print("Name cannot be empty!")
            continue
        }
        print("Please choose the number of which value you want to change: ")
        print("1. Name 2. Release Year 3. Type 4. Quantity")
        guard let option:String = readLine(), !option.isEmpty else{
            print("You need to choose a number")
            continue
        }
        for Movie in MovieList{
            if(Movie.name==name){
                switch option{
                case "1":
                    print("Name: ")
                    guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                        print("Name cannot be empty!")
                        continue
                    }
                    Movie.name = nameStr
                    print("Movie's name changed to \(nameStr) successfully!")
                case "2":
                    print("Release Year: ")
                    guard let yearStr:String = readLine(), !yearStr.isEmpty,Int(yearStr) != nil else{
                        print("Year cannot be empty!")
                        continue
                    }
                    Movie.releaseYear = Int(yearStr)!
                    print("Movie's Release Year changed to \(yearStr) successfully!")
                case "3":
                    //chooseType(movie:Movie)
                    print("Movie's type changed to \(Movie.type) successfully!")
                case "4":
                    print("Quantity: ")
                    guard let quantityStr:String = readLine(), !quantityStr.isEmpty, Int(quantityStr) != nil else{
                        print("Quantity cannot be empty!")
                        continue
                    }
                    Movie.quantity = Int(quantityStr)!
                    print("Movie's quantity changed to \(quantityStr) successfully!")
                default:
                    continue
                }
                
            }
        }
    }
}

func ViewAllMovies(){
    print("All Movies are here: ")
    for Movie in MovieList{
        print("Id: \(Movie.id), Name: \(Movie.name), Release Year: \(Movie.releaseYear), Type: \(Movie.type), Quantity: \(Movie.quantity)")
    }
}

func CreateBooking(){
    
}

func UpdateBooking(){
    
}

func DeleteBooking(){
    
}

func MovieRentalSystem(){
    print("Welcome to Movie Rental Application. Please type the number to select function:")
    print("1.Add Customer")
    print("2.Update Customer")
    print("3.Delete Customer")
    print("4.Display All Customers")
    print("5.Add Movies")
    print("6.Update Movie Details")
    print("7.View all Movies")
    print("8.Create a Movies Booking for specific customer")
    print("9.Update Movie Bookings")
    print("10.Delete Movie Bookings")
    print("0.Exit")
}

//command line application
InitData()
while true {
    MovieRentalSystem()
    guard let option: String = readLine() ,!option.isEmpty else {
        print("Please select one option!")
        continue
    }
    
    switch option{
    case "1" :
        AddCustomer()
    case "2" :
        UpdateCustomer()
    case "3" :
        DeleteCustomer()
    case "4" :
        DisplayAllCustomers()
    case "5" :
        AddMovie()
    case "6":
        UpdateMovieDetails()
    case "7":
        ViewAllMovies()
    case "8":
        CreateBooking()
    case "9":
        UpdateBooking()
    case "10":
        DeleteBooking()
    case "0":
        exit(0)
    default:
        continue
    }
}

