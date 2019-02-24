//
//  DeleteBooking.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit
class DeleteBooking: UIView{
    var deleteBookingView = UIView()
    let uiCreation = UICreation()
    var idInputField = UITextField()
    @objc let displayBooking = DisplayBooking()
    
    func initDeleteBooking(){
        deleteBookingView = UIView(frame: AppDelegate.homeViewRect)
        deleteBookingView.backgroundColor = UIColor.white
        deleteBookingView.isHidden = true
        AppDelegate.homeView.addSubview(deleteBookingView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 100, yValue: 150, width: 300, height: 30, text: "Delete Booking")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        deleteBookingView.addSubview(titleLabel)
        
        //name
        let idLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 250, width: 50, height: 30, text: "Id: ")
        idLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        deleteBookingView.addSubview(idLabel)
        
        idInputField = uiCreation.createTextField(xValue: 59, yValue: 280, width: 300, height: 30, placeHolder: "Enter Id", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        deleteBookingView.addSubview(idInputField)
        
        //add button
        let displayBtn:UIButton = createButton(xValue: 83, yValue: 716, width: 250, height: 30, title:"Display Booking", color: UIColor.brown, action: #selector(displayBookings))
        deleteBookingView.addSubview(displayBtn)
        
        let deleteBtn:UIButton = createButton(xValue: 83, yValue: 766, width: 250, height: 30, title:"Delete Booking", color: UIColor.brown, action: #selector(deleteBooking))
        deleteBookingView.addSubview(deleteBtn)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Previous", color: UIColor.brown, action: #selector(returnToMenu))
        deleteBookingView.addSubview(returnBtn)
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
    
    @objc func deleteBooking() {
        let id = idInputField.text
        if(id == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input the value!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else if(ExistedBooking(id: Int(id!)!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "No. \(id!) isn't existed in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            idInputField.text = ""
        }else {
            for i in 0...AppDelegate.BookingList.count{
                if(AppDelegate.BookingList[i].id == Int(id!)){
                    AppDelegate.BookingList.remove(at: i)
                    break
                }
            }
            let alert = UIAlertView()
            alert.title = "Success: "
            alert.message = "No. \(id!) is deleted in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            displayBookings()
            idInputField.text = ""
        }
    }
    
    func ExistedBooking(id:Int) -> Booking?{
        for Booking in AppDelegate.BookingList{
            if(Booking.id==id){
                return Booking
            }
        }
        return nil
    }
    
    @objc func returnToMenu(){
        deleteBookingView.isHidden = true
    }
    
    @objc func displayBookings(){
        deleteBookingView.isHidden = true
        var result = ""
        for item in AppDelegate.BookingList{
            result += "\n \(item.id)    \(item.movie!.name)        \(item.customer!.name)    \(item.quantity!)"
        }
        displayBooking.initDisplayBooking(result: result)
        displayBooking.displayBookingView.isHidden = false
    }
}
