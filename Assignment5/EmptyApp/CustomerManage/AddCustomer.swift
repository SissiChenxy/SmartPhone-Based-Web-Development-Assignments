//
//  AddCustomer.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit

class AddCustomer : UIView{
    var addCustomerView = UIView()
    let uiCreation = UICreation()
    var nameInputField = UITextField()
    var ageInputField = UITextField()
    var emailInputField = UITextField()
    var addressInputField = UITextField()
    
    let displayCustomer = DisplayCustomer()
    
    func initAddCustomer(){
        addCustomerView = UIView(frame: AppDelegate.homeViewRect)
        addCustomerView.backgroundColor = UIColor.white
        addCustomerView.isHidden = true
        AppDelegate.homeView.addSubview(addCustomerView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 80, yValue: 150, width: 300, height: 30, text: "Add Customer Details")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        addCustomerView.addSubview(titleLabel)
        
        //name
        let nameLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 250, width: 50, height: 30, text: "Name: ")
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addCustomerView.addSubview(nameLabel)
        
        nameInputField = uiCreation.createTextField(xValue: 59, yValue: 280, width: 300, height: 30, placeHolder: "Enter Name", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addCustomerView.addSubview(nameInputField)
        
        //age
        let ageLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 330, width: 50, height: 30, text: "Age: ")
        ageLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addCustomerView.addSubview(ageLabel)
        
        ageInputField = uiCreation.createTextField(xValue: 59, yValue: 360, width: 300, height: 30, placeHolder: "Enter Age", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addCustomerView.addSubview(ageInputField)
        
        //email
        let emailLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 410, width: 50, height: 30, text: "Email: ")
        emailLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addCustomerView.addSubview(emailLabel)
        
        emailInputField = uiCreation.createTextField(xValue: 59, yValue: 440, width: 300, height: 30, placeHolder: "Enter Email", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addCustomerView.addSubview(emailInputField)
        
        //address
        let addressLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 490, width: 100, height: 30, text: "Address: ")
        emailLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addCustomerView.addSubview(addressLabel)
        
        addressInputField = uiCreation.createTextField(xValue: 59, yValue: 520, width: 300, height: 30, placeHolder: "Enter Address", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addCustomerView.addSubview(addressInputField)
        
        //add button
        let addBtn:UIButton = createButton(xValue: 83, yValue: 756, width: 250, height: 30, title:"Add Customer", color: UIColor.brown, action: #selector(addCustomer))
        addCustomerView.addSubview(addBtn)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Menu", color: UIColor.brown, action: #selector(returnToMenu))
        addCustomerView.addSubview(returnBtn)
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
    
    func addCustomer(){
        let name = nameInputField.text
        let age = ageInputField.text
        let email = emailInputField.text
        let address = addressInputField.text
        if(name == "" || age == "" || email == "" || address == "" ){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input the value!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else if(Customer.ExistedCustomer(name: name!) != nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "\(name!) is existed in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else if(Int(age!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "The age should be Integer!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            ageInputField.text = ""
        }else if(validateEmail(email: email!)==false){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "Email is in the wrong format!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            emailInputField.text = ""
        }else{
            let ageInt: Int = Int(age!)!
            let c = Customer(Name: name!, Age: ageInt, Address: address!, Email: email!)
            AppDelegate.CustomerList.append(c)
            let alert = UIAlertView()
            alert.title = "Success: "
            alert.message = "\(name!) is added in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            displayCustomers()
            nameInputField.text = ""
            ageInputField.text = ""
            emailInputField.text = ""
            addressInputField.text = ""
        }
    }
    
    func validateEmail(email:String) -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func returnToMenu(){
        addCustomerView.isHidden = true
    }
    
    func displayCustomers(){
        addCustomerView.isHidden = true
        displayCustomer.initDisplayCustomer()
        displayCustomer.displayCustomerView.isHidden = false
    }
    
}
