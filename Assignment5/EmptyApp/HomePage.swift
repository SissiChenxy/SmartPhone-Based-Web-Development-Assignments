//
//  HomePage.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit

class HomePage : UIView {
    let uiCreation = UICreation()
    let manageCustomer = ManageCustomer()
    let manageMovie = ManageMovie()
    let manageBooking = ManageBooking()
    
    func initHomePage(){
        //welcome words
        let welcomeLabel: UILabel = uiCreation.createLabel(xValue: 130, yValue: 150, width: 200, height: 30, text:"Welcome to")
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        AppDelegate.homeView.addSubview(welcomeLabel)
        let systemLabel: UILabel = uiCreation.createLabel(xValue:50,yValue:200,width:314,height:50,text:"Movie Rental System")
        systemLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
        AppDelegate.homeView.addSubview(systemLabel)
        
        //functionality buttons on home page
        let customerManageBtn:UIButton = createButton(xValue: 107, yValue: 350, width: 200, height: 30, title: "Manage Customer", color: UIColor.brown,action:#selector(showCustomerManageView))
        AppDelegate.homeView.addSubview(customerManageBtn)
        
        let movieManageBtn:UIButton = createButton(xValue: 107, yValue: 420, width: 200, height: 30, title: "Manage Movie", color: UIColor.brown,action:#selector(showMovieManageView))
        AppDelegate.homeView.addSubview(movieManageBtn)

        let bookingManageBtn:UIButton = createButton(xValue: 107, yValue: 490, width: 200, height: 30, title: "Manage Booking", color: UIColor.brown, action: #selector(showBookingManageView))
        AppDelegate.homeView.addSubview(bookingManageBtn)
        
        manageCustomer.initManageCustomer()
        manageMovie.initManageMovie()
        manageBooking.initManageBooking()
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

    
    //show manage customer view
   @objc func showCustomerManageView() {
        manageCustomer.customerManageView.isHidden = false
    }
    //show manage movie view
    @objc func showMovieManageView() {
        manageMovie.movieManageView.isHidden = false
    }
    //show manage booking view
    @objc func showBookingManageView() {
        manageBooking.bookingManageView.isHidden = false
    }
}
