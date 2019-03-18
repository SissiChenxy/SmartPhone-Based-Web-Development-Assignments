//
//  CustomerDetailViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController,UITextFieldDelegate {
    
    var customer = Customer()
    var btnTitle = ""
    
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var agetxt: UITextField!{
        didSet { agetxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var addresstxt: UITextField!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nametxt.delegate = self
        agetxt.delegate = self
        addresstxt.delegate = self
        emailtxt.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if(title == "Edit Customer Details"){
            nametxt.text = customer.name
            agetxt.text = String(customer.age)
            emailtxt.text = customer.email
            addresstxt.text = customer.address
        }
        button.setTitle(btnTitle, for:.normal)
    }
    
    @IBAction func button(_ sender: UIButton) {
        let name = nametxt.text
        let age = agetxt.text
        let email = emailtxt.text
        let address = addresstxt.text
        
            if(name == "" || age == "" || email == "" || address == "" ){
                let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }else if(Int(age!) == nil){
                let alertController = UIAlertController(title: "Error:", message: "The age should be Integer!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                agetxt.text = ""
            }else if(validateEmail(email: email!)==false){
                let alertController = UIAlertController(title: "Error:", message: "Email is in the wrong format!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                emailtxt.text = ""
            }else if(title == "Edit Customer Details"){
                for item in AppDelegate.CustomerList{
                    if(item.id == customer.id){
                        item.name = name!
                        item.age = Int(age!)!
                        item.email = email!
                        item.address = address!
                    }
                }
            }else{
                if(Customer.ExistedCustomer(name: name!,age: Int(age!)!,email: email!,address: address!) != nil){
                    let alertController = UIAlertController(title: "Error:", message: "\(name!) is existed in the system!", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let ageInt: Int = Int(age!)!
                    let c = Customer(Name: name!, Age: ageInt, Address: address!, Email: email!)
                    AppDelegate.CustomerList.append(c)
                }
                nametxt.text = ""
                agetxt.text = ""
                emailtxt.text = ""
                addresstxt.text = ""
            }
        self.navigationController?.popViewController(animated: true)
        }
    
    
    func validateEmail(email:String) -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    //keyboard setting
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        nametxt.resignFirstResponder()
        agetxt.resignFirstResponder()
        addresstxt.resignFirstResponder()
        emailtxt.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
