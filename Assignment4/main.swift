//
//  main.swift
//  try
//
//  Created by Xinyun Chen on 2/14/19.
//  Copyright © 2019 Xinyun Chen. All rights reserved.
//

import Foundation

//class and struct statement
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
    let m1 = Movie(Name:"Movie1", ReleaseYear: 2013, Type:MovieType.Action, Quantity:20)
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



