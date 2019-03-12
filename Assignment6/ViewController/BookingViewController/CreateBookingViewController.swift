//
//  CreateBookingViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class CreateBookingViewController: UIViewController,UITextFieldDelegate {
     var calendar = Calendar(identifier:Calendar.Identifier.iso8601)

    @IBOutlet weak var movietxt: UITextField!
    @IBOutlet weak var customertxt: UITextField!
    @IBOutlet weak var quantitytxt: UITextField!{
        didSet { quantitytxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var bookingyeartxt: UITextField!{
        didSet { bookingyeartxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var bookingmonthtxt: UITextField!{
        didSet { bookingmonthtxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var bookingdaytxt: UITextField!{
        didSet { bookingdaytxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var returnyeartxt: UITextField!{
        didSet { returnyeartxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var returnmonthtxt: UITextField!{
        didSet { returnmonthtxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var returndaytxt: UITextField!{
        didSet { returndaytxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var createBtn: UIButton!
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
        
        if (viewTitle.text == "Update Booking"){
            let updateBookingController = presentingViewController as? UpdateBookingViewController
            let id = updateBookingController!.idtxt.text!
            let b = Booking.FindBooking(id: Int(id)!)
            for item in AppDelegate.BookingList{
                if(item.id == b!.id){
                    item.movie = Movie.FindMovie(name:movie!)!
                    item.customer = Customer.FindCustomer(name:customer!)!
                    item.quantity = Int(quantity!)!
                    item.bookingDate = DateComponents(calendar:calendar,year:Int(bookingYear!),month:Int(bookingMonth!),day:Int(bookingDay!))
                    item.returnDate = DateComponents(calendar:calendar,year:Int(returnYear!),month:Int(returnMonth!),day:Int(returnDay!))
                }
            }
            updateBookingController!.idtxt.text = ""
            let alertController = UIAlertController(title: "Success:", message: "\(movie!) Booking for \(customer!) is updated in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
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
        }else if(movie == "" || customer == "" || quantity == "" || bookingYear == "" || bookingMonth == "" || bookingDay == "" || returnYear == "" || returnMonth == "" || returnDay == ""){
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
        }else if(Movie.FindMovie(name: movie!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "Movie \(movie!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            movietxt.text = ""
        }else if(Customer.FindCustomer(name: customer!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "Customer \(customer!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            customertxt.text = ""
        }else if((Movie.FindMovie(name: movie!)?.quantity)! < Int(quantity!)!){
            let alertController = UIAlertController(title: "Error:", message: "\(movie!) only has \(Movie.FindMovie(name: movie!)!.quantity) in the system!", preferredStyle: .alert)
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
        }else if((Booking.ExistedBooking(movie: movie!, customer: customer!, quantity: Int(quantity!)!, bookingDate: DateComponents(calendar:calendar,year:Int(bookingYear!),month:Int(bookingMonth!),day:Int(bookingDay!)), returnDate: DateComponents(calendar:calendar,year:Int(returnYear!),month:Int(returnMonth!),day:Int(returnDay!)))) != nil){
            let alertController = UIAlertController(title: "Error:", message: "\(movie!) Booking for \(customer!) is already existed!", preferredStyle: .alert)
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
            
        }else{
            let m = Movie.FindMovie(name: movie!)!
            let c = Customer.FindCustomer(name: customer!)!
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
        movietxt.delegate = self
        customertxt.delegate = self
        quantitytxt.delegate = self
        bookingyeartxt.delegate = self
        bookingmonthtxt.delegate = self
        bookingdaytxt.delegate = self
        returnyeartxt.delegate = self
        returnmonthtxt.delegate = self
        returndaytxt.delegate = self

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        movietxt.resignFirstResponder()
        customertxt.resignFirstResponder()
        quantitytxt.resignFirstResponder()
        bookingyeartxt.resignFirstResponder()
        bookingmonthtxt.resignFirstResponder()
        bookingdaytxt.resignFirstResponder()
        returnyeartxt.resignFirstResponder()
        returnmonthtxt.resignFirstResponder()
        returndaytxt.resignFirstResponder()
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
