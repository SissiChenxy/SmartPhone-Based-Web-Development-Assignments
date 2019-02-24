//
//  DeleteCustomer.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit
class DeleteCustomer: UIView{
    var deleteCustomerView = UIView()
    let uiCreation = UICreation()
    var nameInputField = UITextField()
    @objc let displayCustomer = DisplayCustomer()
    
    func initDeleteCustomer(){
        deleteCustomerView = UIView(frame: AppDelegate.homeViewRect)
        deleteCustomerView.backgroundColor = UIColor.white
        deleteCustomerView.isHidden = true
        AppDelegate.homeView.addSubview(deleteCustomerView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 100, yValue: 150, width: 300, height: 30, text: "Delete Customer")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        deleteCustomerView.addSubview(titleLabel)
        
        //name
        let nameLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 250, width: 50, height: 30, text: "Name: ")
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        deleteCustomerView.addSubview(nameLabel)
        
        nameInputField = uiCreation.createTextField(xValue: 59, yValue: 280, width: 300, height: 30, placeHolder: "Enter Name", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        deleteCustomerView.addSubview(nameInputField)
        
        //add button
        let displayBtn:UIButton = createButton(xValue: 83, yValue: 716, width: 250, height: 30, title:"Display Customer", color: UIColor.brown, action: #selector(displayCustomers))
        deleteCustomerView.addSubview(displayBtn)
        
        let deleteBtn:UIButton = createButton(xValue: 83, yValue: 766, width: 250, height: 30, title:"Delete Customer", color: UIColor.brown, action: #selector(deleteCustomer))
        deleteCustomerView.addSubview(deleteBtn)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Previous", color: UIColor.brown, action: #selector(returnToMenu))
        deleteCustomerView.addSubview(returnBtn)
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
    
    @objc func deleteCustomer() {
        let name = nameInputField.text
        if(name == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input the value!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else if(Customer.ExistedCustomer(name: name!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "\(name!) isn't existed in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            nameInputField.text = ""
        }else {
            for i in 0...AppDelegate.CustomerList.count{
                if(AppDelegate.CustomerList[i].name == name){
                    AppDelegate.CustomerList.remove(at: i)
                    break
                }
            }
            let alert = UIAlertView()
            alert.title = "Success: "
            alert.message = "\(name!) is deleted in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            displayCustomers()
            nameInputField.text = ""
        }
    }
    
    func ExistedCustomer(name:String) -> Customer?{
        for Customer in AppDelegate.CustomerList{
            if(Customer.name==name){
                return Customer
            }
        }
        return nil
    }
    
    @objc func returnToMenu(){
        deleteCustomerView.isHidden = true
    }
    
    @objc func displayCustomers(){
        deleteCustomerView.isHidden = true
        displayCustomer.initDisplayCustomer()
        displayCustomer.displayCustomerView.isHidden = false
    }
}
