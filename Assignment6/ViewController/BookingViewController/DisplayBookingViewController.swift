//
//  DisplayBookingViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/2/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class DisplayBookingViewController: UIViewController{

    @IBOutlet weak var textArea: UITextView!
    @IBAction func backToPrevious(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        var result = ""
        for item in AppDelegate.BookingList{
            result += "Id: \(item.id) \n"
            result += "Movie: \(item.movie!.name) \n"
            result += "Customer: \(item.customer!.name) \n"
            result += "Quantity: \(item.quantity!) \n"
            result += "Booking From: \(item.bookingDate!.year!)-\(item.bookingDate!.month!)-\(item.bookingDate!.day!) \n"
            result += "Booking To: \(item.returnDate!.year!)-\(item.returnDate!.month!)-\(item.returnDate!.day!) \n"
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
