//
//  SearchMovieViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class SearchBookingViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var nametxt: UITextField!
    @IBAction func searchByMovie(_ sender: UIButton) {
        let name = nametxt.text
        var existed:Int = 0
        var searchList : Array<Booking> = Array()
        if(Movie.FindMovie(name: name!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "Movie \(name!) doesn't exist in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
            nametxt.text = ""
            existed = 2
        }else{
            for item in AppDelegate.BookingList{
                
                if(item.movie!.name == name){
                    searchList.append(item)
                    existed = 1
                }
            }
        }
        
        if(existed == 1 && searchList.isEmpty == false){
            var result = ""
            for item in searchList{
                result += "Id: \(item.id) \n"
                result += "Movie: \(item.movie!.name) \n"
                result += "Customer: \(item.customer!.name) \n"
                result += "Quantity: \(item.quantity!) \n"
                result += "Booking From: \(item.bookingDate!.year!)-\(item.bookingDate!.month!)-\(item.bookingDate!.day!) \n"
                result += "Booking To: \(item.returnDate!.year!)-\(item.returnDate!.month!)-\(item.returnDate!.day!) \n"
                result += "------------------------------- \n"
            }
            let displayBookingController = DisplayBookingViewController(nibName:"DisplayBookingView",bundle:nil)
            displayBookingController.modalTransitionStyle = .flipHorizontal
            present(displayBookingController, animated: true, completion: nil)
            
            if let disVC = presentedViewController as? DisplayBookingViewController{
                disVC.textArea.text = result
            }
            //textArea.text = result
            
            nametxt.text = ""
        }else if(existed == 0){
            let alertController = UIAlertController(title: "Error:", message: "\(name!) doesn't have any bookings in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            nametxt.text = ""
        }
    }
    
    
    @IBAction func searchByCustomer(_ sender: UIButton) {
        let name = nametxt.text
        var existed:Int = 0
        var searchList : Array<Booking> = Array()
        if(Customer.FindCustomer(name: name!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "Customer \(name!) doesn't exist in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            nametxt.text = ""
            existed = 2
        }else{
            
            for item in AppDelegate.BookingList{
                if(item.customer!.name == name){
                    searchList.append(item)
                    existed = 1
                }
            }
        }
        
        if(existed == 1 && searchList.isEmpty == false){
            var result = ""
            for item in searchList{
                result += "Id: \(item.id) \n"
                result += "Movie: \(item.movie!.name) \n"
                result += "Customer: \(item.customer!.name) \n"
                result += "Quantity: \(item.quantity!) \n"
                result += "Booking From: \(item.bookingDate!.year!)-\(item.bookingDate!.month!)-\(item.bookingDate!.day!) \n"
                result += "Booking To: \(item.returnDate!.year!)-\(item.returnDate!.month!)-\(item.returnDate!.day!) \n"
                result += "------------------------------- \n"
            }
            let displayBookingController = DisplayBookingViewController(nibName:"DisplayBookingView",bundle:nil)
            displayBookingController.modalTransitionStyle = .flipHorizontal
            present(displayBookingController, animated: true, completion: nil)
            
            if let disVC = presentedViewController as? DisplayBookingViewController{
                disVC.textArea.text = result
            }
            //textArea.text = result
            nametxt.text = ""
        }else if(existed == 0){
            let alertController = UIAlertController(title: "Error:", message: "\(name!) doesn't have any bookings in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            nametxt.text = ""
        }
    }
    @IBAction func backToPrevious(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nametxt.delegate = self

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
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
