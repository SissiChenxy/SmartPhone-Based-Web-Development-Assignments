//
//  Customer.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/2/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
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
    
    static func FindCustomer(name:String) -> Customer?{
        for Customer in AppDelegate.CustomerList{
            if(Customer.name==name){
                return Customer
            }
        }
        return nil
    }
    
    static func ExistedCustomer(name:String,age:Int,email:String,address:String) -> Customer?{
        for Customer in AppDelegate.CustomerList{
            if(Customer.name==name&&Customer.age==age&&Customer.email==email&&Customer.address==address){
                return Customer
            }
        }
        return nil
    }
}
