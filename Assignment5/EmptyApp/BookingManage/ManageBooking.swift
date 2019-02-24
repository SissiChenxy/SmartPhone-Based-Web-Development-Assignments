//
//  ManageBooking.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageBooking: UIView{
    var bookingManageView = UIView()
    var addBookingView = UIView()
    var deleteBookingView = UIView()
    var displayBookingView = UIView()
    
    let uiCreation = UICreation()
    let addBooking = AddBooking()
    let deleteBooking = DeleteBooking()
    let displayBooking = DisplayBooking()
    let searchBooking = SearchBooking()
    
    func initManageBooking(){
        bookingManageView = UIView(frame: AppDelegate.homeViewRect)
        bookingManageView.backgroundColor = UIColor.white
        bookingManageView.isHidden = true
        AppDelegate.homeView.addSubview(bookingManageView)
        
        let addBookingBtn:UIButton = createButton(xValue: 107, yValue: 300, width: 200, height: 30, title: "Add Booking", color: UIColor.brown, action: #selector(showAddBookingView))
        bookingManageView.addSubview(addBookingBtn)
        
        let deleteBookingBtn:UIButton = createButton(xValue: 107, yValue: 380, width: 200, height: 30, title: "Delete Booking", color: UIColor.brown, action: #selector(showDeleteBookingView))
        bookingManageView.addSubview(deleteBookingBtn)
        
        let displayBookingBtn:UIButton = createButton(xValue: 107, yValue: 460, width: 200, height: 30, title: "Display Booking", color: UIColor.brown, action: #selector(showDisplayBookingView))
        bookingManageView.addSubview(displayBookingBtn)
        
        let searchBookingBtn:UIButton = createButton(xValue: 107, yValue: 540, width: 200, height: 30, title: "Search Booking", color: UIColor.brown, action: #selector(showSearchBookingView))
        bookingManageView.addSubview(searchBookingBtn)
        
        let backBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title: "Back to Home Page", color: UIColor.brown, action: #selector(showHomeView))
        bookingManageView.addSubview(backBtn)
        
        addBooking.initAddBooking()
        deleteBooking.initDeleteBooking()
        searchBooking.initSearchBooking()
        var result = ""
        for item in AppDelegate.BookingList{
            result += "\n \(item.id)    \(item.movie!.name)        \(item.customer!.name)    \(item.quantity!)"
        }
        displayBooking.initDisplayBooking(result: result)
        
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
    
    //show add booking view
    @objc func showAddBookingView() {
        addBooking.addBookingView.isHidden = false
    }
    //show delete booking view
    @objc func showDeleteBookingView() {
        deleteBooking.deleteBookingView.isHidden = false
    }
    
    @objc func showDisplayBookingView() {
        var result = ""
        for item in AppDelegate.BookingList{
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
    }
    
    @objc func showSearchBookingView() {
        searchBooking.searchBookingView.isHidden = false
    }
    
    @objc func showHomeView() {
        bookingManageView.isHidden = true
    }
    
}
