//
//  DeleteCustomerViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class DeleteCustomerViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nametxt: UITextField!
    @IBAction func deleteCustomer(_ sender: UIButton) {
        let name = nametxt.text
        if(name == ""){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else if(Customer.FindCustomer(name: name!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "\(name!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            nametxt.text = ""
        }else {
            for i in 0...AppDelegate.CustomerList.count{
                if(AppDelegate.CustomerList[i].name == name){
                    AppDelegate.CustomerList.remove(at: i)
                    break
                }
            }
            let alertController = UIAlertController(title: "Success:", message: "\(name!) is deleted in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
//            let displayCustomerController = DisplayCustomerViewController(nibName:"DisplayCustomerView",bundle:nil)
//            displayCustomerController.modalTransitionStyle = .flipHorizontal
//            self.present(displayCustomerController, animated: true, completion: nil)
            nametxt.text = ""
            //dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func displayCustomer(_ sender: UIButton) {
        let displayCustomerController = DisplayCustomerViewController(nibName:"DisplayCustomerView",bundle:nil)
        displayCustomerController.modalTransitionStyle = .flipHorizontal
        self.present(displayCustomerController, animated: true, completion: nil)
    }
    @IBAction func backToPrevious(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nametxt.delegate = self

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        nametxt.resignFirstResponder()
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
