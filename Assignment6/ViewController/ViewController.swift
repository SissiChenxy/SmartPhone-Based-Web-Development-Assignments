//
//  ViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 2/27/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class ViewController:


    UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var manageCustomerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        welcomeLabel.text = "lalalal"
    }

    @IBAction func ManageCustomer(_ sender: UIButton) {
        let manageCustomerController = ManageCustomerViewController(nibName:"ManageCustomerMenu",bundle:nil)
        manageCustomerController.modalTransitionStyle = .flipHorizontal
        self.present(manageCustomerController, animated: true, completion: nil)
    }
    @IBAction func ManageMovie(_ sender: UIButton) {
        let manageMovieController = ManageMovieViewController(nibName:"ManageMovieMenu",bundle:nil)
        manageMovieController.modalTransitionStyle = .flipHorizontal
        self.present(manageMovieController, animated: true, completion: nil)
    }
    
    @IBAction func ManageBooking(_ sender: UIButton) {
        let manageBookingController = ManageBookingViewController(nibName:"ManageBookingMenu",bundle:nil)
        manageBookingController.modalTransitionStyle = .flipHorizontal
        self.present(manageBookingController, animated: true, completion: nil)
    }
    
}

