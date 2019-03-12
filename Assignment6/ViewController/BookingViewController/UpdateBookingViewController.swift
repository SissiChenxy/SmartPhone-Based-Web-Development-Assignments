//
//  UpdateBookingViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/3/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class UpdateBookingViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var idtxt: UITextField!{
        didSet { idtxt?.addDoneCancelToolbar() }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        idtxt.delegate=self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateBooking(_ sender: UIButton) {
        let id = idtxt.text
        
        if(id == ""){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        }else if(Booking.FindBooking(id: Int(id!)!) == nil) {
            let alertController = UIAlertController(title: "Alert:", message: "Booking \(id!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        }else {
            let createBookingController = CreateBookingViewController(nibName:"CreateBookingView",bundle:nil)
            createBookingController.modalTransitionStyle = .flipHorizontal
            present(createBookingController, animated: true, completion: nil)
            if let updateVC = presentedViewController as? CreateBookingViewController{
                let b = Booking.FindBooking(id: Int(id!)!)
                updateVC.movietxt.text = b!.movie!.name
                updateVC.customertxt.text = b!.customer!.name
                updateVC.quantitytxt.text = String(b!.quantity!)
                updateVC.bookingyeartxt.text = String(b!.bookingDate!.year!)
                updateVC.bookingmonthtxt.text = String(b!.bookingDate!.month!)
                updateVC.bookingdaytxt.text = String(b!.bookingDate!.day!)
                updateVC.returnyeartxt.text = String(b!.returnDate!.year!)
                updateVC.returnmonthtxt.text = String(b!.returnDate!.month!)
                updateVC.returndaytxt.text = String(b!.returnDate!.day!)
                
                updateVC.viewTitle.text = "Update Booking"
                updateVC.createBtn.setTitle("Save Changes", for: .normal)
            }
        }
    }
    @IBAction func displayBooking(_ sender: UIButton) {
        let displayBookingController = DisplayBookingViewController(nibName:"DisplayBookingView",bundle:nil)
        displayBookingController.modalTransitionStyle = .flipHorizontal
        self.present(displayBookingController, animated: true, completion: nil)
    }
    @IBAction func backToPrevious(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        idtxt.resignFirstResponder()
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
