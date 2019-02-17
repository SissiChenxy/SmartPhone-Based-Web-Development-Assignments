//
//  Customer.swift
//  try
//
//  Created by Xinyun Chen on 2/14/19.
//  Copyright © 2019 Xinyun Chen. All rights reserved.
//

import Foundation

class Customer{
    var id: Int = customerId
    var name: String = ""
    var age: Int = 0
    var email: String = ""
    var address: String = ""
    static var customerId:Int = 1
    
    init(){}
    init(Name:String, Age: Int, Address:String, Email:String){
        Customer.customerId += 1
        self.name = Name
        self.age = Age
        self.email = Email
        self.address = Address
    }
}

var CustomerList: Array<Customer> = Array()

func AddCustomer(){
    while(true){
        var name:String = ""
        var age:Int = 0
        var email:String = ""
        var address:String = ""
        
        while(true){
            print("Name:")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Name cannot be empty! \n")
                continue
            }
            name = nameStr
            break
        }
        
        while (true){
            print("Age:")
            guard let ageStr:String = readLine(),!ageStr.isEmpty, Int(ageStr) != nil else{
                print("Age cannot be empty or String! \n")
                continue
            }
            age = Int(ageStr)!
            break
        }
        
        while(true){
            print("Email:")
            guard let emailStr:String = readLine(), !emailStr.isEmpty else{
                print("Email cannot be empty! \n")
                continue
            }
            if(validateEmail(email: emailStr)==false){
                print("Please input the email in the correct format \n")
                continue
            }
            email = emailStr
            break
        }
        while(true){
            print("Address:")
            guard let addressStr:String = readLine(), !addressStr.isEmpty else{
                print("Address cannot be empty! \n")
                continue
            }
            address = addressStr
            break
        }
        let customer = Customer(Name: name, Age: age, Address: address, Email: email)
        CustomerList.append(customer)
        print("Customer: \(customer.name) created successfully! \n")
        DisplayAllCustomers()
        break
    }
}

func validateEmail(email:String) -> Bool {
    let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailTest.evaluate(with: email)
}

func ExistedCustomer(name:String) -> Customer?{
    for Customer in CustomerList{
        if(Customer.name==name){
            return Customer
        }
    }
    return nil
}

func UpdateCustomer(){
    var targetCustomer = Customer()
    
    while(true){
        print("Please input the name of the customer you want to update: ")
        guard let nameStr:String = readLine(),!nameStr.isEmpty else{
            print("Name cannot be empty! \n")
            continue
        }
        if ExistedCustomer(name: nameStr) == nil {
            print("This Customer doesn't exist in system \n")
            continue
        }
        targetCustomer = ExistedCustomer(name: nameStr)!
        break
    }
    
    while(true){
        print("Please choose the number of which value you want to change: ")
        print("1. Name 2. Age 3. Email 4. Address")
        guard let option:String = readLine(), !option.isEmpty else{
            print("You need to choose a number")
            continue
        }
        
        
        switch option{
        case "1":
            print("Name: ")
            guard let nameStr:String = readLine(), !nameStr.isEmpty else{
                print("Name cannot be empty! \n")
                continue
            }
            targetCustomer.name = nameStr
            print("Customer's name changed to \(targetCustomer.name) successfully! \n")
        case "2":
            print("Age: ")
            guard let ageStr:String = readLine(), !ageStr.isEmpty,Int(ageStr) != nil else{
                print("Age cannot be empty!")
                continue
            }
            targetCustomer.age = Int(ageStr)!
            print("Customer's age changed to \(targetCustomer.age) successfully! \n")
        case "3":
            print("Email: ")
            guard let emailStr:String = readLine(), !emailStr.isEmpty else{
                print("Email cannot be empty! \n")
                continue
            }
            if(validateEmail(email: emailStr)==false){
                print("Please input the email in the correct format \n")
                continue
            }
            targetCustomer.email = emailStr
            print("Customer's email changed to \(targetCustomer.email) successfully!")
        case "4":
            print("Address: ")
            guard let addressStr:String = readLine(), !addressStr.isEmpty else{
                print("Address cannot be empty! \n")
                continue
            }
            targetCustomer.address = addressStr
            print("Customer's address changed to \(targetCustomer.address) successfully! \n")
        default:
            print("The number you choose doesn't exist. Please follow the instruction \n")
            continue
        }
        break
    }
}

func DeleteCustomer(){
    DisplayAllCustomers()
    while (true) {
        print("Please input the name of the customer who you want to delete \n")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Name cannot be empty! \n")
            continue
        }
        if (ExistedCustomer(name: name) == nil){
            print("Customer doesn't exist \n")
            continue
        }else{
            for i in 0...CustomerList.count-1{
                if(CustomerList[i].name == name){
                    CustomerList.remove(at:i)
                    print("\(name) is deleted successfully! \n")
                    DisplayAllCustomers()
                    break
                }
            }
        }
        break
    }
}

func DisplayAllCustomers(){
    if(CustomerList.isEmpty){
        print("No Customer in the system now \n")
        while(true){
            print("Do you want to add one customer now? (yes or no)")
            guard let option:String = readLine(), !option.isEmpty else{
                print("Please select one option! \n")
                continue
            }
            if (option == "yes"){
                AddCustomer()
            }else{
                break
            }
        }
    }else{
        print("------------------ All Customers are here ---------------------")
        for Customer in CustomerList{
            print("Id: \(Customer.id), Name: \(Customer.name), Age: \(Customer.age), Email: \(Customer.email), Address: \(Customer.address) \n")
        }
        print("----------------------------------------------------------------")
    }
}
