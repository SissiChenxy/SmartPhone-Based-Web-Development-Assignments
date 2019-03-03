//
//  DeleteBookingViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class DeleteBookingViewController: UIViewController {

    @IBOutlet weak var idtxt: UITextField!
    @IBAction func deleteBooking(_ sender: UIButton) {
        let id = idtxt.text
        if(id == ""){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else if(Booking.ExistedBooking(id: Int(id!)!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "\(id!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            idtxt.text = ""
        }else {
            for i in 0...AppDelegate.BookingList.count{
                if(AppDelegate.BookingList[i].id == Int(id!)){
                    AppDelegate.BookingList.remove(at: i)
                    break
                }
            }
            let alertController = UIAlertController(title: "Success:", message: "No. \(id!) is deleted in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            idtxt.text = ""
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
