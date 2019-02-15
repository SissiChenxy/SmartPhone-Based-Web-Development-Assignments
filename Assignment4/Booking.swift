//
//  Booking.swift
//  try
//
//  Created by Xinyun Chen on 2/14/19.
//  Copyright © 2019 Xinyun Chen. All rights reserved.
//

import Foundation
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

func CreateBooking(){
    ViewAllMovies()
    CreateBookingLabel: while(true){
        
        var movieName:String = ""
        var customerName:String = ""
        var quantity:Int = 0
        var bookingDate:String = ""
        var returnDate:String = ""
        
        MovieNameLabel: while(true){
            print("Name of Movie you want to book is : ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Movie name cannot be empty! \n")
                continue
            }
            if(ExistedMovie(name: nameStr)==nil){
                print("The movie you search doesn't exist! \n")
                continue
            }else{
                movieName = nameStr
                break MovieNameLabel
            }
        }
        
        CustomerNameLabel:while(true){
            DisplayAllCustomers()
            print("Name of Customer you want to book for is : ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Customer name cannot be empty! \n")
                continue
            }
            if(ExistedCustomer(name: nameStr)==nil){
                print("The movie you search doesn't exist! \n")
                continue
            }else{
                movieName = nameStr
                break CustomerNameLabel
            }
        }
        
        QuantityLabel:while(true){
            print("Quantity of Movies you want to book is : ")
            guard let quantityStr:String = readLine(), !quantityStr.isEmpty,Int(quantityStr) != nil else{
                print("Quantity cannot be empty! \n")
                continue
            }
            quantity = Int(quantityStr)!
            break QuantityLabel
        }
        
        BookingDateLabel:while(true){
            print("Date you want to book from is : ")
            guard let bookingDateStr:String = readLine(), !bookingDateStr.isEmpty else{
                print("Booking Date cannot be empty! \n")
                continue
            }
            bookingDate = bookingDateStr
            break BookingDateLabel
        }
        
        ReturnDateLabel:while(true){
            print("Date you want to return is : ")
            guard let returnDateStr:String = readLine(), !returnDateStr.isEmpty else{
                print("Booking Date cannot be empty! \n")
                continue
            }
            returnDate = returnDateStr
            break ReturnDateLabel
        }
        
        let booking = Booking()
        booking.movie = ExistedMovie(name: movieName)
        booking.customer = ExistedCustomer(name: customerName)
        booking.quantity = quantity
        booking.bookingDate = bookingDate
        booking.returnDate = returnDate
        BookingList.append(booking)
        print("Booking of \(quantity) \(movieName) for \(customerName) is created successfully! \n")
        break CreateBookingLabel
    }
}

func ShowAllBookings(){
    if(BookingList.isEmpty){
        print("No booking in system now! \n")
    }else{
        print("All Bookings are here : ")
        for Booking in BookingList {
            print("Id: \(Booking.id), Movie: \(Booking.movie), Customer: \(Booking.customer), Quantity: \(Booking.quantity), Booking Date: \(Booking.bookingDate), Return Date: \(Booking.returnDate) \n")
        }
    }
}

func ExistedBooking(id:Int) -> Booking?{
    for Booking in BookingList{
        if(Booking.id==id){
            return Booking
        }
    }
    return nil
}

func UpdateBooking(){
    ShowAllBookings()
    var targetBooking = Booking()
    
    while(true){
        print("Please input the id of the booking you want to update: ")
        guard let idStr:String = readLine(),!idStr.isEmpty else{
            print("Id cannot be empty! \n")
            continue
        }
        let id:Int = Int(idStr)!
        if ExistedBooking(id:id) == nil {
            print("This Booking doesn't exist in system \n")
            continue
        }
        targetBooking = ExistedBooking(id: id)!
        break
    }
    
    while(true){
        print("Please choose the number of which value you want to change: ")
        print("1. Movie 2. Customer 3. Quantity 4. Booking Date 5. Return Date")
        guard let option:String = readLine(), !option.isEmpty else{
            print("You need to choose a number")
            continue
        }
        
        
        switch option{
        case "1":
            print("Name of the Movie: ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Movie Name cannot be empty! \n")
                continue
            }
            targetBooking.movie = ExistedMovie(name: nameStr)
            print("Booking's movie changed to \(targetBooking.movie) successfully! \n")
        case "2":
            print("Name of the Customer: ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Name of the Customer cannot be empty!")
                continue
            }
            targetBooking.customer = ExistedCustomer(name: nameStr)
            print("Booking's customer changed to \(targetBooking.customer) successfully! \n")
        case "3":
            print("Quantity: ")
            guard let quantityStr:String = readLine(), !quantityStr.isEmpty,Int(quantityStr) != nil else{
                print("Quantity cannot be empty! \n")
                continue
            }
            targetBooking.quantity = Int(quantityStr)!
            print("Booking's quantity changed to \(targetBooking.quantity) successfully!")
        case "4":
            print("Booking Date: ")
            guard let bookingDateStr:String = readLine(), !bookingDateStr.isEmpty else{
                print("Booking Date cannot be empty! \n")
                continue
            }
            targetBooking.bookingDate = bookingDateStr
            print("Booking's start date changed to \(targetBooking.bookingDate) successfully! \n")
        case "5":
            print("Return Date: ")
            guard let returnDateStr:String = readLine(), !returnDateStr.isEmpty else{
                print("Return Date cannot be empty! \n")
                continue
            }
            targetBooking.returnDate = returnDateStr
            print("Booking's return date changed to \(targetBooking.returnDate) successfully! \n")
        default:
            print("The number you choose doesn't exist. Please follow the instruction \n")
            continue
        }
        break
    }
}

func DeleteBooking(){
    ShowAllBookings()
    while (true) {
        print("Please input the id of the booking who you want to delete \n")
        guard let id:String = readLine(), !id.isEmpty, Int(id) != nil else{
            print("Id cannot be empty! \n")
            continue
        }
        for Booking in BookingList{
            if(Booking.id == Int(id)){
                BookingList.remove(at:Booking.id-1)
                print("Booking \(Booking.id) is deleted successfully! \n")
            }else{
                print("Booking doesn't exist \n")
            }
        }
        ShowAllBookings()
        break
    }
}
