//
//  ManageCustomerViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 2/28/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class ManageCustomerViewController: UIViewController {

    @IBAction func createCustomerView(_ sender: UIButton) {
        let createCustomerController = CreateCustomerViewController(nibName:"CreateCustomerView",bundle:nil)
        createCustomerController.modalTransitionStyle = .flipHorizontal
        self.present(createCustomerController, animated: true, completion: nil)
    }
    
    @IBAction func deleteCustomerView(_ sender: UIButton) {
        let deleteCustomerController = DeleteCustomerViewController(nibName:"DeleteCustomerView",bundle:nil)
        deleteCustomerController.modalTransitionStyle = .flipHorizontal
        self.present(deleteCustomerController, animated: true, completion: nil)
    }
    @IBAction func displayCustomerView(_ sender: UIButton) {
        let displayCustomerController = DisplayCustomerViewController(nibName:"DisplayCustomerView",bundle:nil)
        displayCustomerController.modalTransitionStyle = .flipHorizontal
        self.present(displayCustomerController, animated: true, completion: nil)
    }
    @IBAction func returnToHome(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
