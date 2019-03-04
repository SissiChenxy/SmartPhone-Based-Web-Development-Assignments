//
//  UpdateCustomerViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/3/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class UpdateCustomerViewController: UIViewController {

    @IBOutlet weak var nametxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func updateCustomer(_ sender: UIButton) {
        let name = nametxt.text
        
        if(name == ""){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else if(Customer.FindCustomer(name: name!) == nil) {
            let alertController = UIAlertController(title: "Alert:", message: "\(name!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        
        }else{
            
            let createCustomerController = CreateCustomerViewController(nibName:"CreateCustomerView",bundle:nil)
            createCustomerController.modalTransitionStyle = .flipHorizontal
            present(createCustomerController, animated: true, completion: nil)
            if let updateVC = presentedViewController as? CreateCustomerViewController{
                let c = Customer.FindCustomer(name: name!)
                
                updateVC.nametxt.text = c!.name
                updateVC.agetxt.text = String(c!.age)
                updateVC.emailtxt.text = c!.email
                updateVC.addresstxt.text = c!.address
                updateVC.viewTitle.text = "Update Customer"
                updateVC.createBtn.setTitle("Save Changes", for: .normal)
            }
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
