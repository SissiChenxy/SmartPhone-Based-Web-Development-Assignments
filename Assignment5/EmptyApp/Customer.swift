//
//  Customer.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/21/19.
//  Copyright © 2019 rab. All rights reserved.
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
    let customer = Customer()
    while(true){
        print("Name:")
        guard let name:String = readLine(), !name.isEmpty else{
            print("Name cannot be empty! \n")
            continue
        }
        customer.name = name
        break
    }
    while(true){
        print("Age:")
        guard let age:String = readLine(),!age.isEmpty, Int(age) != nil else{
            print("Age cannot be empty! \n")
            continue
        }
        customer.age = Int(age)!
        break
    }
    while(true){
        print("Email:")
        guard let email:String = readLine(), !email.isEmpty else{
            print("Email cannot be empty! \n")
            continue
        }
        customer.email = email
        break
    }
    while(true){
        print("Address:")
        guard let address:String = readLine(), !address.isEmpty else{
            print("Address cannot be empty! \n")
            continue
        }
        customer.address = address
        break
    }
    CustomerList.append(customer)
    print("Customer: \(customer.name) created successfully! \n")
    DisplayAllCustomers()
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
        for Customer in CustomerList{
            if(Customer.name == name){
                CustomerList.remove(at:Customer.id-1)
                print("Customer \(Customer.name) is deleted successfully! \n")
            }else{
                print("Customer doesn't exist \n")
            }
        }
        DisplayAllCustomers()
        break
    }
}

func DisplayAllCustomers(){
    if(CustomerList.isEmpty){
        print("No Customer in the system now \n")
    }else{
        print("All Customers are here:")
        for Customer in CustomerList{
            print("Id: \(Customer.id), Name: \(Customer.name), Age: \(Customer.age), Email: \(Customer.email), Address: \(Customer.address) \n")
        }
    }
}

