//
//  DisplayCustomerViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class DisplayCustomerViewController: UIViewController {

    @IBOutlet weak var textArea: UITextView!
    @IBAction func displayCustomer(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        var result = ""
        for item in AppDelegate.CustomerList{
            result += "Id: \(item.id) \n"
            result += "Name: \(item.name) \n"
            result += "Age: \(item.age) \n"
            result += "Email: \(item.email) \n"
            result += "Address: \(item.address) \n"
            result += "---------------------------------- \n"
        }
        textArea.text = result
        
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
