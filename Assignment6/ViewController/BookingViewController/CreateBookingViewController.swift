//
//  CreateBookingViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class CreateBookingViewController: UIViewController {
     var calendar = Calendar(identifier:Calendar.Identifier.iso8601)

    @IBOutlet weak var movietxt: UITextField!
    @IBOutlet weak var customertxt: UITextField!
    @IBOutlet weak var quantitytxt: UITextField!
    @IBOutlet weak var bookingyeartxt: UITextField!
    @IBOutlet weak var bookingmonthtxt: UITextField!
    @IBOutlet weak var bookingdaytxt: UITextField!
    @IBOutlet weak var returnyeartxt: UITextField!
    @IBOutlet weak var returnmonthtxt: UITextField!
    @IBOutlet weak var returndaytxt: UITextField!
    @IBAction func createMovie(_ sender: UIButton) {
        let movie = movietxt.text
        let customer = customertxt.text
        let quantity = quantitytxt.text
        let bookingYear = bookingyeartxt.text
        let bookingMonth = bookingmonthtxt.text
        let bookingDay = bookingdaytxt.text
        let returnYear = returnyeartxt.text
        let returnMonth = returnmonthtxt.text
        let returnDay = returndaytxt.text
        
        if(movie == "" || customer == "" || quantity == "" || bookingYear == "" || bookingMonth == "" || bookingDay == "" || returnYear == "" || returnMonth == "" || returnDay == ""){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else if(Int(quantity!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "The quantity should be Integer!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            quantitytxt.text = ""
        }else if(Movie.ExistedMovie(name: movie!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "Movie \(movie!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            movietxt.text = ""
        }else if(Customer.ExistedCustomer(name: customer!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "Customer \(customer!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            customertxt.text = ""
        }else if((Movie.ExistedMovie(name: movie!)?.quantity)! < Int(quantity!)!){
            let alertController = UIAlertController(title: "Error:", message: "\(movie!) only has \(Movie.ExistedMovie(name: movie!)!.quantity) in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            quantitytxt.text = ""
        }else if(Int(returnYear!)! < Int(bookingYear!)!){
            let alertController = UIAlertController(title: "Error:", message: "Return Year couldn't be less than Booking Year!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            bookingyeartxt.text = ""
            returnyeartxt.text = ""
        }else if(Int(bookingYear!)! == Int(returnYear!)! && Int(bookingMonth!)! > Int(returnMonth!)!){
            let alertController = UIAlertController(title: "Error:", message: "Return Month couldn't be less than Booking Month!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            bookingmonthtxt.text = ""
            returnmonthtxt.text = ""
        }else if(Int(bookingYear!)! == Int(returnYear!)! && Int(bookingMonth!)! == Int(returnMonth!)! && Int(bookingDay!)! > Int(returnDay!)!){
            let alertController = UIAlertController(title: "Error:", message: "Return Date couldn't be same or less than Booking Date!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            bookingdaytxt.text = ""
            returndaytxt.text = ""
        }else{
            let m = Movie.ExistedMovie(name: movie!)!
            let c = Customer.ExistedCustomer(name: customer!)!
            let booking = Booking(BookingDate: DateComponents(calendar:calendar,year:Int(bookingYear!),month:Int(bookingMonth!),day:Int(bookingDay!)), ReturnDate: DateComponents(calendar:calendar,year:Int(returnYear!),month:Int(returnMonth!),day:Int(returnDay!)), Customer:c , Movie:m , Quantity: Int(quantity!)!)
            m.quantity -= Int(quantity!)!
            AppDelegate.BookingList.append(booking)
            let alertController = UIAlertController(title: "Success:", message: "No. \(booking.id) is added in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
            movietxt.text = ""
            customertxt.text = ""
            quantitytxt.text = ""
            bookingyeartxt.text = ""
            bookingmonthtxt.text = ""
            bookingdaytxt.text = ""
            returnyeartxt.text = ""
            returnmonthtxt.text = ""
            returndaytxt.text = ""
        }
    }
    @IBAction func displayMovie(_ sender: UIButton) {
        let displayMovieController = DisplayMovieViewController(nibName:"DisplayMovieView",bundle:nil)
        displayMovieController.modalTransitionStyle = .flipHorizontal
        self.present(displayMovieController, animated: true, completion: nil)
    }
    @IBAction func displayCustomer(_ sender: UIButton) {
        let displayCustomerController = DisplayCustomerViewController(nibName:"DisplayCustomerView",bundle:nil)
        displayCustomerController.modalTransitionStyle = .flipHorizontal
        self.present(displayCustomerController, animated: true, completion: nil)
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
