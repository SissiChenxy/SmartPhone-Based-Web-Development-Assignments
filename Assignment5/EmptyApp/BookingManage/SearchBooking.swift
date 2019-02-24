//
//  SearchBooking.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit
class SearchBooking:UIView{
    var searchBookingView = UIView()
    let uiCreation = UICreation()
    var nameInputField = UITextField()
    @objc let displayBooking = DisplayBooking()
    let displayMovie = DisplayMovie()
    let displayCustomer = DisplayCustomer()
    
    func initSearchBooking(){
        searchBookingView = UIView(frame: AppDelegate.homeViewRect)
        searchBookingView.backgroundColor = UIColor.white
        searchBookingView.isHidden = true
        AppDelegate.homeView.addSubview(searchBookingView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 130, yValue: 150, width: 300, height: 30, text: "Search Booking")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        searchBookingView.addSubview(titleLabel)
        
        //name
        let nameLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 250, width: 50, height: 30, text: "Name: ")
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        searchBookingView.addSubview(nameLabel)
        
        nameInputField = uiCreation.createTextField(xValue: 59, yValue: 280, width: 300, height: 30, placeHolder: "Enter Name", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        searchBookingView.addSubview(nameInputField)
        
        //add button
        let searchByMovieBtn:UIButton = createButton(xValue: 83, yValue: 716, width: 250, height: 30, title:"Search By Movie", color: UIColor.brown, action: #selector(searchByMovie))
        searchBookingView.addSubview(searchByMovieBtn)
        
        let searchByNameBtn:UIButton = createButton(xValue: 83, yValue: 766, width: 250, height: 30, title:"Search By Customer", color: UIColor.brown, action: #selector(searchByCustomer))
        searchBookingView.addSubview(searchByNameBtn)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Previous", color: UIColor.brown, action: #selector(returnToMenu))
        searchBookingView.addSubview(returnBtn)
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
    
    @objc func searchByMovie(){
        let name = nameInputField.text
        var existed:Int = 0
        var searchList : Array<Booking> = Array()
        if(Movie.ExistedMovie(name: name!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Movie \(name!) doesn't exist in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            displayMovie.initDisplayMovie()
            displayMovie.displayMovieView.isHidden = false
            nameInputField.text = ""
            existed = 2
        }else{
            for item in AppDelegate.BookingList{
                
                if(item.movie!.name == name){
                    searchList.append(item)
                    existed = 1
                }
            }
        }
        
        if(existed == 1 && searchList.isEmpty == false){
            var result = ""
            for i in searchList{
                result += "\n \(i.id)    \(i.movie!.name)        \(i.customer!.name)    \(i.quantity!)"
            }
            displayBooking.initDisplayBooking(result: result)
            displayBooking.displayBookingView.isHidden = false
            nameInputField.text = ""
        }else if(existed == 0){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "\(name!) doesn't have any bookings in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            nameInputField.text = ""
        }
    }
    
    @objc func searchByCustomer(){
        let name = nameInputField.text
        var existed:Int = 0
        var searchList : Array<Booking> = Array()
        if(Customer.ExistedCustomer(name: name!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Customer \(name!) doesn't exist in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            displayCustomer.initDisplayCustomer()
            displayCustomer.displayCustomerView.isHidden = false
            nameInputField.text = ""
            existed = 2
        }else{
            
            for item in AppDelegate.BookingList{
                if(item.customer!.name == name){
                    searchList.append(item)
                    existed = 1
                }
            }
        }
            
        if(existed == 1 && searchList.isEmpty == false){
            var result = ""
            for item in searchList{
                result += "Id: \(item.id) \n"
                result += "Movie: \(item.movie!.name) \n"
                result += "Customer: \(item.customer!.name) \n"
                result += "Quantity: \(item.quantity!) \n"
                result += "Booking From: \(item.bookingDate!.year!)-\(item.bookingDate!.month!)-\(item.bookingDate!.day!) \n"
                result += "Booking To: \(item.returnDate!.year!)-\(item.returnDate!.month!)-\(item.returnDate!.day!) \n"
                result += "----------------------------------- \n"
            }
            displayBooking.initDisplayBooking(result: result)
            displayBooking.displayBookingView.isHidden = false
            nameInputField.text = ""
        }else if(existed == 0){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "\(name!) doesn't have any bookings in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            nameInputField.text = ""
        }
        
    }
    
    @objc func returnToMenu(){
        searchBookingView.isHidden = true
    }
}
