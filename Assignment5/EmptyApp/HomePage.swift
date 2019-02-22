//
//  HomePage.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
import UIKit

class HomePage {
    let uiCreation = UICreation()
    let manageCustomer = ManageCustomer()
    let manageMovie = ManageMovie()
    let manageBooking = ManageBooking()
    
    func initHomePage(homeView: UIView,viewReact:CGRect){
        //welcome words
        let welcomeLabel: UILabel = uiCreation.createLabel(xValue: 130, yValue: 150, width: 200, height: 30, text:"Welcome to")
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        homeView.addSubview(welcomeLabel)
        let systemLabel: UILabel = uiCreation.createLabel(xValue:50,yValue:200,width:314,height:50,text:"Movie Rental System")
        systemLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
        homeView.addSubview(systemLabel)
        
        //functionality buttons on home page
        let customerManageBtn:UIButton = uiCreation.createButton(xValue: 107, yValue: 350, width: 200, height: 30, title: "Manage Customer", color: UIColor.brown,action: #selector(showCustomerManageView))
        homeView.addSubview(customerManageBtn)
        
        let movieManageBtn:UIButton = uiCreation.createButton(xValue: 107, yValue: 420, width: 200, height: 30, title: "Manage Movie", color: UIColor.brown,action:#selector(showMovieManageView))
        homeView.addSubview(movieManageBtn)
        
        let bookingManageBtn:UIButton = uiCreation.createButton(xValue: 107, yValue: 490, width: 200, height: 30, title: "Manage Booking", color: UIColor.brown,action:#selector(showBookingManageView))
        homeView.addSubview(bookingManageBtn)
        
        manageCustomer.initManageCustomer(homePage: homeView, viewReact: viewReact)
        
    }
    
    //show manage customer view
    @objc func showCustomerManageView() {
        print("manageCustomer.test")
        manageCustomer.customerManageView?.isHidden = false
        
    }
    //show manage movie view
    @objc func showMovieManageView() {
        manageMovie.movieManageView?.isHidden = false
    }
    //show manage booking view
    @objc func showBookingManageView() {
        manageBooking.bookingManageView?.isHidden = false
    }
}
