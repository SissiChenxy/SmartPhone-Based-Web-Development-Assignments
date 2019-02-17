//
//  Booking.swift
//  try
//
//  Created by Xinyun Chen on 2/14/19.
//  Copyright © 2019 Xinyun Chen. All rights reserved.
//

import Foundation
var calendar = Calendar(identifier:Calendar.Identifier.iso8601)

class Booking{
    var id: Int = bookingId
    var customer: Customer?
    var movie: Movie?
    var quantity: Int?
    var bookingDate: DateComponents?
    var returnDate: DateComponents?
    static var bookingId:Int = 1
    
    init(){}
    init(BookingDate:DateComponents,ReturnDate:DateComponents, Customer:Customer, Movie:Movie, Quantity:Int){
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
        var bookingDate:DateComponents = DateComponents(calendar:calendar,year:2019,month:1,day:1)
        var returnDate:DateComponents = DateComponents(calendar:calendar,year:2019,month:1,day:1)
        
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
                customerName = nameStr
                break CustomerNameLabel
            }
        }
        
        QuantityLabel:while(true){
            print("Quantity of Movies you want to book is : ")
            guard let quantityStr:String = readLine(), !quantityStr.isEmpty,Int(quantityStr) != nil else{
                print("Quantity cannot be empty! \n")
                continue
            }
            if(Int(quantityStr)! > ExistedMovie(name: movieName)!.quantity){
                print("Sorry! The remaining quantity of this movie is only \(ExistedMovie(name: movieName)!.quantity) \n")
                continue
            }else{
                ExistedMovie(name: movieName)!.quantity -= quantity
            }
            quantity = Int(quantityStr)!
            break QuantityLabel
        }
        
        DateLabel: while(true){
            var day = ""
            BookingDateLabel:while(true){
                
                print("Month you want to book from is : ")
                guard let monthStr:String = readLine(), !monthStr.isEmpty else{
                    print("Booking Month cannot be empty! \n")
                    continue
                }
                while(true){
                    print("Day you want to book from is : ")
                    guard let dayStr:String = readLine(), !dayStr.isEmpty else{
                        print("Booking Day cannot be empty! \n")
                        continue
                    }
                    day = dayStr
                    break
                }
                bookingDate = DateComponents(calendar: calendar, year: 2019, month: Int(monthStr)!, day:Int(day)!)
                if(!bookingDate.isValidDate){
                    print("Not valid date, please check the input")
                    continue
                }
                break BookingDateLabel
            }
            
            ReturnDateLabel:while(true){
            
                print("Month you want to book to is : ")
                guard let monthStr:String = readLine(), !monthStr.isEmpty else{
                    print("Return Month cannot be empty! \n")
                    continue
                }
                while(true){
                    print("Day you want to book to is : ")
                    guard let dayStr:String = readLine(), !dayStr.isEmpty else{
                        print("Return Day cannot be empty! \n")
                        continue
                    }
                    day = dayStr
                    break
                }
                returnDate = DateComponents(calendar: calendar, year: 2019, month: Int(monthStr)!, day:Int(day)!)
                if(!returnDate.isValidDate){
                    print("Not valid date, please check the input")
                    continue
                }
                break ReturnDateLabel
            }
            
            if(returnDate.month! < bookingDate.month!){
                print("Error: end Date early than start Date, Choose Again")
                continue DateLabel
            }else if(returnDate.month! == bookingDate.month! && returnDate.day! < bookingDate.day!){
                print("Error: end Date early than start Date, Choose Again")
                continue DateLabel
            }
            break DateLabel
        }
        
        let booking = Booking()
        booking.movie = ExistedMovie(name: movieName)!
        booking.customer = ExistedCustomer(name: customerName)!
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
        while(true){
            print("Do you want to add one booking now? (yes or no)")
            guard let option:String = readLine(), !option.isEmpty else{
                print("Please select one option! \n")
                continue
            }
            if (option == "yes"){
                CreateBooking()
            }else{
                break
            }
        }
    }else{
        print("----------------- All Bookings are here ------------------ ")
        for Booking in BookingList {
            print("Id: \(Booking.id), Movie: \(Booking.movie!.name), Customer: \(Booking.customer!.name), Quantity: \(Booking.quantity!), Booking Date: \(Booking.bookingDate!.year!)-\(Booking.bookingDate!.month!)-\(Booking.bookingDate!.day!), Return Date: \(Booking.returnDate!.year!)-\(Booking.returnDate!.month!)-\(Booking.returnDate!.day!) \n")
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
            ViewAllMovies()
            print("Name of the Movie: ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Movie Name cannot be empty! \n")
                continue
            }
            targetBooking.movie = ExistedMovie(name: nameStr)!
            print("Booking's movie changed to \(targetBooking.movie!.name) successfully! \n")
        case "2":
            DisplayAllCustomers()
            print("Name of the Customer: ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Name of the Customer cannot be empty!")
                continue
            }
            targetBooking.customer = ExistedCustomer(name: nameStr)!
            print("Booking's customer changed to \(targetBooking.customer!.name) successfully! \n")
        case "3":
            print("Quantity: ")
            guard let quantityStr:String = readLine(), !quantityStr.isEmpty,Int(quantityStr) != nil else{
                print("Quantity cannot be empty! \n")
                continue
            }
            targetBooking.quantity = Int(quantityStr)!
            print("Booking's quantity changed to \(targetBooking.quantity!) successfully!")
        case "4":
            print("Booking Date: ")
            print("Month you want to book from is : ")
            guard let monthStr:String = readLine(), !monthStr.isEmpty else{
                print("Booking Month cannot be empty! \n")
                continue
            }
            var day = ""
            while(true){
                print("Day you want to book from is : ")
                guard let dayStr:String = readLine(), !dayStr.isEmpty else{
                    print("Booking Day cannot be empty! \n")
                    continue
                }
                day = dayStr
                break
            }
            targetBooking.bookingDate = DateComponents(calendar: calendar, year: 2019, month: Int(monthStr)!, day:Int(day)!)
            print("Booking's start date changed to \(targetBooking.bookingDate!.year!)-\(targetBooking.bookingDate!.month!)-\(targetBooking.bookingDate!.day!) successfully! \n")
        case "5":
            print("Return Date: ")
            print("Month you want to book to is : ")
            guard let monthStr:String = readLine(), !monthStr.isEmpty else{
                print("Booking Month cannot be empty! \n")
                continue
            }
            var day = ""
            while(true){
                print("Day you want to book to is : ")
                guard let dayStr:String = readLine(), !dayStr.isEmpty else{
                    print("Booking Day cannot be empty! \n")
                    continue
                }
                day = dayStr
                break
            }
            targetBooking.returnDate = DateComponents(calendar: calendar, year: 2019, month: Int(monthStr)!, day:Int(day)!)
            print("Booking's return date changed to \(targetBooking.returnDate!.year!)-\(targetBooking.returnDate!.month!)-\(targetBooking.returnDate!.day!) successfully! \n")
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
            if (ExistedBooking(id: Int(id)!) == nil){
                print("Booking doesn't exist \n")
                continue
            }else{
                for i in 0...BookingList.count-1{
                    if(BookingList[i].id == Int(id)!){
                        print(BookingList[i].id)
                        BookingList.remove(at:i)
                        print("Booking No. \(id) is deleted successfully! \n")
                        ShowAllBookings()
                        break
                    }
                }
            }
            break
        }
}
