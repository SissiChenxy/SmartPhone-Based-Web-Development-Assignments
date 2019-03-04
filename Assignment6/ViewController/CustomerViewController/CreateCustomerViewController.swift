//
//  CreateCustomerViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class CreateCustomerViewController: UIViewController {

    
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var agetxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var addresstxt: UITextField!
    
    @IBOutlet weak var createBtn: UIButton!
    @IBAction func createCustomer(_ sender: UIButton) {
        let name = nametxt.text
        let age = agetxt.text
        let email = emailtxt.text
        let address = addresstxt.text
        
        if (viewTitle.text == "Update Customer"){
            let updateCustomerController = presentingViewController as? UpdateCustomerViewController
            let nameParse = updateCustomerController!.nametxt.text!
            let c = Customer.FindCustomer(name: nameParse)!
                for item in AppDelegate.CustomerList{
                    if(item.id == c.id){
                        item.name = name!
                        item.age = Int(age!)!
                        item.email = email!
                        item.address = address!
                    }
            }
            updateCustomerController!.nametxt.text = ""
            let alertController = UIAlertController(title: "Success:", message: "\(name!) is updated in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            nametxt.text = ""
            agetxt.text = ""
            emailtxt.text = ""
            addresstxt.text = ""
        }else if(name == "" || age == "" || email == "" || address == "" ){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else if(Customer.ExistedCustomer(name: name!,age: Int(age!)!,email: email!,address: address!) != nil){
            let alertController = UIAlertController(title: "Error:", message: "\(name!) is existed in the system!", preferredStyle: .alert)
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
        }else{
            let ageInt: Int = Int(age!)!
            let c = Customer(Name: name!, Age: ageInt, Address: address!, Email: email!)
            AppDelegate.CustomerList.append(c)
            let alertController = UIAlertController(title: "Success:", message: "\(name!) is added in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
            nametxt.text = ""
            agetxt.text = ""
            emailtxt.text = ""
            addresstxt.text = ""
        }
    }
    
    @IBAction func backToPrevious(_ sender: UIButton) {
        
            dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateEmail(email:String) -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
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
