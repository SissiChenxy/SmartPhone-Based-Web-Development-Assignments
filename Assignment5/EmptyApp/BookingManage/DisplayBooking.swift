//
//  DisplayBooking.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit
class DisplayBooking: UIView{
    var displayBookingView = UIView()
    var BookingListView = UITextView()
    let uiCreation = UICreation()
    
    func initDisplayBooking(result:String){
        displayBookingView = UIView(frame: AppDelegate.homeViewRect)
        displayBookingView.backgroundColor = UIColor.white
        displayBookingView.isHidden = true
        AppDelegate.homeView.addSubview(displayBookingView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 80, yValue: 150, width: 300, height: 30, text: "Display All Bookings")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        displayBookingView.addSubview(titleLabel)
        
        //show list
        BookingListView = uiCreation.createTextView(xValue: 50, yValue: 230, width: 300, height: 500)
        BookingListView.text = result
        displayBookingView.addSubview(BookingListView)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Menu", color: UIColor.brown, action: #selector(returnToMenu))
        displayBookingView.addSubview(returnBtn)
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
    
    func returnToMenu(){
        displayBookingView.isHidden = true
    }
    
}
