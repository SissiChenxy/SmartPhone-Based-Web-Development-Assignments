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
    let c2 = Customer(Name:"Nancy", Age:18 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"nancy@gmail.com")
    let c3 = Customer(Name:"Lily", Age:12 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"lily@163.com")
    let c4 = Customer(Name:"Sue", Age:29 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"sue@gmail.com")
    let c5 = Customer(Name:"Susan", Age:32 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"susan@gmail.com")
    CustomerList.append(c1)
    CustomerList.append(c2)
    CustomerList.append(c3)
    CustomerList.append(c4)
    CustomerList.append(c5)
    
    let m1 = Movie(Name:"Movie1", ReleaseYear: 2013, Type:MovieType.Action, Quantity:20)
    let m2 = Movie(Name:"Movie2", ReleaseYear: 1999, Type:MovieType.Animation, Quantity:10)
    let m3 = Movie(Name:"Movie3", ReleaseYear: 2004, Type:MovieType.Comedy, Quantity:15)
    let m4 = Movie(Name:"Movie4", ReleaseYear: 2015, Type:MovieType.Documentary, Quantity:26)
    let m5 = Movie(Name:"Movie5", ReleaseYear: 2019, Type:MovieType.Musical, Quantity:29)
    MovieList.append(m1)
    MovieList.append(m2)
    MovieList.append(m3)
    MovieList.append(m4)
    MovieList.append(m5)
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

SystemLabel : while true {
    MovieRentalSystem()
    guard let option: String = readLine() ,!option.isEmpty else {
        print("Please select one option!")
        continue
    }
    
    switch option{
    case "1" :
        AddCustomerLabel: while(true){
            AddCustomer()
            OptionLabel: while(true){
                print("Continue(yes) or Quit(no) \n")
                guard let option: String = readLine() ,!option.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                break OptionLabel
            }
            if(option == "yes"){
                print(option)
                continue AddCustomerLabel
            }else{
                break AddCustomerLabel
            }
        }
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
        print("Please follow the instructions \n")
        continue SystemLabel
    }
}

