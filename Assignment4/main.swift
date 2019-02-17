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
    
    let m1 = Movie(Name:"Movie1", ReleaseYear: 2013, Type:MovieType.Action, Quantity:3)
    let m2 = Movie(Name:"Movie2", ReleaseYear: 1999, Type:MovieType.Animation, Quantity:2)
    let m3 = Movie(Name:"Movie3", ReleaseYear: 2004, Type:MovieType.Comedy, Quantity:5)
    let m4 = Movie(Name:"Movie4", ReleaseYear: 2015, Type:MovieType.Documentary, Quantity:6)
    let m5 = Movie(Name:"Movie5", ReleaseYear: 2019, Type:MovieType.Musical, Quantity:1)
    MovieList.append(m1)
    MovieList.append(m2)
    MovieList.append(m3)
    MovieList.append(m4)
    MovieList.append(m5)
    
    let b1 = Booking(BookingDate: DateComponents(calendar:calendar,year:2019,month:1,day:1),ReturnDate: DateComponents(calendar:calendar,year:2019,month:1,day:5), Customer: CustomerList[0], Movie: MovieList[0], Quantity: 3)
    let b2 = Booking(BookingDate: DateComponents(calendar:calendar,year:2019,month:3,day:4),ReturnDate: DateComponents(calendar:calendar,year:2019,month:4,day:7), Customer: CustomerList[1], Movie: MovieList[1], Quantity: 2)
    BookingList.append(b1)
    BookingList.append(b2)
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

SystemLabel : while (true) {
    MovieRentalSystem()
    guard let option: String = readLine() ,!option.isEmpty else {
        print("Please select one option!")
        continue
    }
    
    switch option{
    case "1" :
        AddCustomerLabel: while(true){
            AddCustomer()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue AddCustomerLabel
            }else if(choice == "back"){
                break AddCustomerLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "2" :
        UpdateCustomerLabel: while(true){
            UpdateCustomer()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue UpdateCustomerLabel
            }else if(choice == "back"){
                break UpdateCustomerLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "3" :
        DeleteCustomerLabel: while(true){
            DeleteCustomer()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue DeleteCustomerLabel
            }else if(choice == "back"){
                break DeleteCustomerLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "4" :
        DisplayAllCustomers()
        MainMenuLabel: while(true){
        print("Back to main menu(yes) or quit(no) \n")
        guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
            print("Please select one option!")
            continue MainMenuLabel
        }
            if(choiceStr == "yes"){
                break MainMenuLabel
            }else{
                exit(0)
            }
    }
    case "5" :
        AddMovieLabel: while(true){
            AddMovie()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue AddMovieLabel
            }else if(choice == "back"){
                break AddMovieLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "6":
        UpdateMovieLabel: while(true){
            UpdateMovieDetails()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue UpdateMovieLabel
            }else if(choice == "back"){
                break UpdateMovieLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "7":
        ViewAllMovies()
        MainMenuLabel: while(true){
            print("Back to main menu(yes) or quit(no) \n")
            guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                print("Please select one option!")
                continue MainMenuLabel
            }
            if(choiceStr == "yes"){
                break MainMenuLabel
            }else{
                exit(0)
            }
        }
    case "8":
        CreateBookingLabel: while(true){
            CreateBooking()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue CreateBookingLabel
            }else if(choice == "back"){
                break CreateBookingLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "9":
        
        UpdateBookingLabel: while(true){
            UpdateBooking()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue UpdateBookingLabel
            }else if(choice == "back"){
                break UpdateBookingLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "10":
        
        DeleteBookingLabel: while(true){
            DeleteBooking()
            var choice: String = "no"
            OptionLabel: while(true){
                print("Continue(yes), Back to Main Menu(back) or Quit(no) \n")
                guard let choiceStr: String = readLine() ,!choiceStr.isEmpty else {
                    print("Please select one option!")
                    continue OptionLabel
                }
                choice = choiceStr
                break OptionLabel
            }
            if(choice == "yes"){
                continue DeleteBookingLabel
            }else if(choice == "back"){
                break DeleteBookingLabel
            }else if(choice == "no"){
                exit(0)
            }
        }
    case "0":
        exit(0)
    default:
        print("Please follow the instructions \n")
        continue SystemLabel
    }
}

