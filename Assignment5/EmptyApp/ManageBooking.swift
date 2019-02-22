//
//  ManageBooking.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageBooking{
    var bookingManageView: UIView?
    var addBookingView: UIView?
    var deleteBookingView: UIView?
    var displayBookingView: UIView?
    
    let uiCreation = UICreation()
    let app = AppDelegate()
    
    func initManageBooking(homePage: UIView,viewReact:CGRect){
        bookingManageView = UIView(frame: viewReact)
        bookingManageView?.isHidden = true
        homePage.addSubview(bookingManageView!)
        
        let addBookingBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 300, width: 150, height: 30, title: "Add Booking", color: UIColor.brown, action: #selector(showAddBookingView))
        bookingManageView?.addSubview(addBookingBtn)
        
        let deleteBookingBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 380, width: 150, height: 30, title: "Delete Booking", color: UIColor.brown, action: #selector(showDeleteBookingView))
        bookingManageView?.addSubview(deleteBookingBtn)
        
        let displayBookingBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 460, width: 200, height: 30, title: "Display Booking", color: UIColor.brown, action: #selector(showDisplayBookingView))
        bookingManageView?.addSubview(displayBookingBtn)
        
        let backBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 816, width: 250, height: 30, title: "Back to Home Page", color: UIColor.brown, action: #selector(showHomeView))
        bookingManageView?.addSubview(backBtn)
    }
    
    //show add booking view
    @objc func showAddBookingView() {
        addBookingView?.isHidden = false
    }
    //show delete booking view
    @objc func showDeleteBookingView() {
        deleteBookingView?.isHidden = false
    }
    
    @objc func showDisplayBookingView() {
        displayBookingView?.isHidden = false
    }
    
    @objc func showHomeView() {
        app.homeView.isHidden = false
    }
    
}
