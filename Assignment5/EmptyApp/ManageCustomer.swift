//
//  ManageCustomer.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageCustomer{
    var test:Int = 66
    var customerManageView: UIView?
    var addCustomerView: UIView?
    var deleteCustomerView: UIView?
    var displayCustomerView: UIView?
    
    let uiCreation = UICreation()
    let app = AppDelegate()
    
    //buttons on customer manage page
    func initManageCustomer(homePage: UIView,viewReact:CGRect){
        customerManageView = UIView(frame: viewReact)
        customerManageView?.isHidden = true
        homePage.addSubview(customerManageView!)
        
        let addCustomerBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 300, width: 200, height: 30, title: "Add Customer", color: UIColor.brown,action:#selector(showAddCustomerView))
        customerManageView?.addSubview(addCustomerBtn)
        
        let deleteCustomerBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 380, width: 200, height: 30, title: "Delete Customer", color: UIColor.brown,action:#selector(showDeleteCustomerView))
        customerManageView?.addSubview(deleteCustomerBtn)
        
        let displayCustomerBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 460, width: 200, height: 30, title: "Display Customer", color: UIColor.brown,action:#selector(showDisplayCustomerView))
        customerManageView?.addSubview(displayCustomerBtn)
        
        let backBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 816, width: 250, height: 30, title: "Back to Home Page", color: UIColor.brown,action:#selector(showHomeView))
        customerManageView?.addSubview(backBtn)
    }
    
    //show add customer view
    @objc func showAddCustomerView() {
        addCustomerView?.isHidden = false
    }
    //show delete customer view
    @objc func showDeleteCustomerView() {
        deleteCustomerView?.isHidden = false
    }
    
    @objc func showDisplayCustomerView() {
        displayCustomerView?.isHidden = false
    }
    
    @objc func showHomeView() {
        app.homeView.isHidden = false
    }
}
