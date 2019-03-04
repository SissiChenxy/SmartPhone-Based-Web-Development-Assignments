//
//  ManageBookingViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class ManageBookingViewController: UIViewController {

    @IBAction func createBooking(_ sender: UIButton) {
        let createBookingController = CreateBookingViewController(nibName:"CreateBookingView",bundle:nil)
        createBookingController.modalTransitionStyle = .flipHorizontal
        self.present(createBookingController, animated: true, completion: nil)
    }
    @IBAction func deleteBooking(_ sender: UIButton) {
        let deleteBookingController = DeleteBookingViewController(nibName:"DeleteBookingView",bundle:nil)
        deleteBookingController.modalTransitionStyle = .flipHorizontal
        self.present(deleteBookingController, animated: true, completion: nil)
    }
    @IBAction func searchBooking(_ sender: UIButton) {
        let searchBookingController = SearchBookingViewController(nibName:"SearchBookingView",bundle:nil)
        searchBookingController.modalTransitionStyle = .flipHorizontal
        self.present(searchBookingController, animated: true, completion: nil)
    }
    @IBAction func updateBooking(_ sender: UIButton) {
        let updateBookingController = UpdateBookingViewController(nibName:"UpdateBookingView",bundle:nil)
        updateBookingController.modalTransitionStyle = .flipHorizontal
        self.present(updateBookingController, animated: true, completion: nil)
    }
    @IBAction func displayBookingView(_ sender: UIButton) {
        let displayBookingController = DisplayBookingViewController(nibName:"DisplayBookingView",bundle:nil)
        displayBookingController.modalTransitionStyle = .flipHorizontal
        self.present(displayBookingController, animated: true, completion: nil)
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
