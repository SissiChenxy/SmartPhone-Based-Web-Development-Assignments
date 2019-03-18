//
//  ViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/13/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func manageCustomer(_ sender: CustomButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "customerTVC")
        self.navigationController?.show(vc, sender: self)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func manageMovie(_ sender: CustomButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "movieTVC")
        self.navigationController?.show(vc, sender: self)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func manageBooking(_ sender: CustomButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "bookingTVC")
        self.navigationController?.show(vc, sender: self)
        self.navigationController?.isNavigationBarHidden = true
    }
}

