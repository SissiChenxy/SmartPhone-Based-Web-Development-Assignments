//
//  AddBooking.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit
class AddBooking: UIView{
    
    var calendar = Calendar(identifier:Calendar.Identifier.iso8601)
    var addBookingView = UIView()
    let uiCreation = UICreation()
    var movieInputField = UITextField()
    var customerInputField = UITextField()
    var quantityInputField = UITextField()
    var bookingYearInputField = UITextField()
    var bookingMonthInputField = UITextField()
    var bookingDayInputField = UITextField()
    var returnYearInputField = UITextField()
    var returnMonthInputField = UITextField()
    var returnDayInputField = UITextField()
    let displayBooking = DisplayBooking()
    
    
    func initAddBooking(){
        addBookingView = UIView(frame: AppDelegate.homeViewRect)
        addBookingView.backgroundColor = UIColor.white
        addBookingView.isHidden = true
        AppDelegate.homeView.addSubview(addBookingView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 80, yValue: 150, width: 300, height: 30, text: "Add Customer Details")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        addBookingView.addSubview(titleLabel)
        
        //name
        let movieLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 250, width: 100, height: 30, text: "Movie Name: ")
        movieLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addBookingView.addSubview(movieLabel)
        
        movieInputField = uiCreation.createTextField(xValue: 59, yValue: 280, width: 300, height: 30, placeHolder: "Enter Movie Name", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(movieInputField)
        
        let customerLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 330, width: 150, height: 30, text: "Customer Name: ")
        customerLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addBookingView.addSubview(customerLabel)
        
        customerInputField = uiCreation.createTextField(xValue: 59, yValue: 360, width: 300, height: 30, placeHolder: "Enter Customer Name", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(customerInputField)
        
        //quantity
        let quantityLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 410, width: 100, height: 30, text: "Quantity: ")
        quantityLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addBookingView.addSubview(quantityLabel)
        
        quantityInputField = uiCreation.createTextField(xValue: 59, yValue: 440, width: 300, height: 30, placeHolder: "Enter Quantity", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(quantityInputField)
        
        //booking Date
        let bookingDateLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 500, width: 150, height: 30, text: "Booking From: ")
        bookingDateLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addBookingView.addSubview(bookingDateLabel)
        
        bookingYearInputField = uiCreation.createTextField(xValue: 59, yValue: 530, width: 100, height: 30, placeHolder: "Enter Year", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(bookingYearInputField)
        
        bookingMonthInputField = uiCreation.createTextField(xValue: 169, yValue: 530, width: 100, height: 30, placeHolder: "Enter Month", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(bookingMonthInputField)
        
        bookingDayInputField = uiCreation.createTextField(xValue: 279, yValue: 530, width: 100, height: 30, placeHolder: "Enter Day", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(bookingDayInputField)
        
        
        //return Date
        let returnDateLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 580, width: 100, height: 30, text: "Booking To: ")
        returnDateLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addBookingView.addSubview(returnDateLabel)
        
        returnYearInputField = uiCreation.createTextField(xValue: 59, yValue: 610, width: 100, height: 30, placeHolder: "Enter Year", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(returnYearInputField)
        
        returnMonthInputField = uiCreation.createTextField(xValue: 169, yValue: 610, width: 100, height: 30, placeHolder: "Enter Month", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(returnMonthInputField)
        
        returnDayInputField = uiCreation.createTextField(xValue: 279, yValue: 610, width: 100, height: 30, placeHolder: "Enter Day", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addBookingView.addSubview(returnDayInputField)
    
        
        //add button
        let addBtn:UIButton = createButton(xValue: 83, yValue: 756, width: 250, height: 30, title:"Add Booking", color: UIColor.brown, action: #selector(addBooking))
        addBookingView.addSubview(addBtn)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Menu", color: UIColor.brown, action: #selector(returnToMenu))
        addBookingView.addSubview(returnBtn)
    }
    
    func createButton(xValue:Double, yValue:Double,width:Double,height:Double,title:String,color:UIColor,action:Selector) -> UIButton {
        let button: UIButton = UIButton(type:.roundedRect)
        button.frame = CGRect(x:xValue,y:yValue,width:width,height:height)
        button.layer.cornerRadius = CGFloat(height / 2)
        button.setTitle(title, for: UIControlState.normal)
        button.backgroundColor = color
        button.setTitleColor(UIColor.white,for: UIControlState.normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(height-10))
        return button
    }
    
    func addBooking(){
        let movie = movieInputField.text
        let customer = customerInputField.text
        let quantity = quantityInputField.text
        let bookingYear = bookingYearInputField.text
        let bookingMonth = bookingMonthInputField.text
        let bookingDay = bookingDayInputField.text
        let returnYear = returnYearInputField.text
        let returnMonth = returnMonthInputField.text
        let returnDay = returnDayInputField.text
        
        if(movie == "" || customer == "" || quantity == "" || bookingYear == "" || bookingMonth == "" || bookingDay == "" || returnYear == "" || returnMonth == "" || returnDay == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input the value!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else if(Int(quantity!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "The quantity should be Integer!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            quantityInputField.text = ""
        }else if(Movie.ExistedMovie(name: movie!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Movie \(movie!) isn't existed in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            movieInputField.text = ""
        }else if(Customer.ExistedCustomer(name: customer!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Customer \(customer!) isn't existed in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            customerInputField.text = ""
        }else if((Movie.ExistedMovie(name: movie!)?.quantity)! < Int(quantity!)!){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "\(movie!) only has \(Movie.ExistedMovie(name: movie!)!.quantity) in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            quantityInputField.text = ""
        }else if(Int(bookingYear!)! < Int(returnYear!)!){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Return Year couldn't be less than Booking Year!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            bookingYearInputField.text = ""
            returnYearInputField.text = ""
        }else if(Int(bookingYear!)! == Int(returnYear!)! && Int(bookingMonth!)! > Int(returnMonth!)!){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Return Month couldn't be less than Booking Month!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            bookingMonthInputField.text = ""
            returnMonthInputField.text = ""
        }else if(Int(bookingYear!)! == Int(returnYear!)! && Int(bookingMonth!)! == Int(returnMonth!)! && Int(bookingDay!)! > Int(returnDay!)!){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Return Date couldn't be same or less than Booking Date!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            bookingDayInputField.text = ""
            returnDayInputField.text = ""
        }else{
            let m = Movie.ExistedMovie(name: movie!)!
            let c = Customer.ExistedCustomer(name: customer!)!
            let booking = Booking(BookingDate: DateComponents(calendar:calendar,year:Int(bookingYear!),month:Int(bookingMonth!),day:Int(bookingDay!)), ReturnDate: DateComponents(calendar:calendar,year:Int(returnYear!),month:Int(returnMonth!),day:Int(returnDay!)), Customer:c , Movie:m , Quantity: Int(quantity!)!)
            m.quantity -= Int(quantity!)!
            AppDelegate.BookingList.append(booking)
            let alert = UIAlertView()
            alert.title = "Success: "
            alert.message = "No. \(booking.id) is added in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            displayBookings()
            movieInputField.text = ""
            customerInputField.text = ""
            quantityInputField.text = ""
            bookingYearInputField.text = ""
            bookingMonthInputField.text = ""
            bookingDayInputField.text = ""
            returnYearInputField.text = ""
            returnMonthInputField.text = ""
            returnDayInputField.text = ""
        }
        
    }
    
    func returnToMenu(){
        addBookingView.isHidden = true
    }
    
    func displayBookings(){
        addBookingView.isHidden = true
        var result = ""
        for item in AppDelegate.BookingList{
            result += "\n \(item.id)    \(item.movie!.name)        \(item.customer!.name)    \(item.quantity!)"
        }
        displayBooking.initDisplayBooking(result: result)
        displayBooking.displayBookingView.isHidden = false
    }
}
