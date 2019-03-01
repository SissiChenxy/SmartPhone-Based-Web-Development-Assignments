//
//  ManageCustomer.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit

class ManageCustomer : UIView{
    var customerManageView = UIView()
    
    let uiCreation = UICreation()
    let addCustomer = AddCustomer()
    let displayCustomer = DisplayCustomer()
    let deleteCustomer = DeleteCustomer()
    
    //buttons on customer manage page
    func initManageCustomer(){
        customerManageView = UIView(frame: AppDelegate.homeViewRect)
        customerManageView.backgroundColor = UIColor.white
        customerManageView.isHidden = true
        AppDelegate.homeView.addSubview(customerManageView)
        
        let addCustomerBtn:UIButton = createButton(xValue: 107, yValue: 300, width: 200, height: 30, title: "Add Customer", color: UIColor.brown,action:#selector(showAddCustomerView))
        customerManageView.addSubview(addCustomerBtn)
        
        let deleteCustomerBtn:UIButton = createButton(xValue: 107, yValue: 380, width: 200, height: 30, title: "Delete Customer", color: UIColor.brown,action:#selector(showDeleteCustomerView))
        customerManageView.addSubview(deleteCustomerBtn)

        let displayCustomerBtn:UIButton = createButton(xValue: 107, yValue: 460, width: 200, height: 30, title: "Display Customer", color: UIColor.brown,action:#selector(showDisplayCustomerView))
        customerManageView.addSubview(displayCustomerBtn)

        let backBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title: "Back to Home Page", color: UIColor.brown,action:#selector(showHomeView))
        customerManageView.addSubview(backBtn)
        
        
        addCustomer.initAddCustomer()
        //displayCustomer.initDisplayCustomer()
        deleteCustomer.initDeleteCustomer()
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
    
    //show add customer view
    @objc func showAddCustomerView() {
        addCustomer.addCustomerView.isHidden = false
    }
    //show delete customer view
    @objc func showDeleteCustomerView() {
        deleteCustomer.deleteCustomerView.isHidden = false
    }
    
    @objc func showDisplayCustomerView() {
        displayCustomer.initDisplayCustomer()
        displayCustomer.displayCustomerView.isHidden = false
    }
    
    @objc func showHomeView(sender:UIButton) {
        customerManageView.isHidden = true
        
    }
}
