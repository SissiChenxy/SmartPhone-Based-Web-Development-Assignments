//
//  BookingDetailViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class BookingDetailViewController: UIViewController,UITextFieldDelegate {
    
    var booking = Booking()
    var btnTitle = ""
    var bookingDateValue = 0
    var returnDateValue = 0
    var dateValue = DateFormatter()
    //dateValue.dateFormat = "YYYY MM dd" // 调用别的函数不能写在class里面
    
    
    @IBOutlet weak var movietxt: UITextField!
    @IBOutlet weak var customertxt: UITextField!
    @IBOutlet weak var quantitytxt: UITextField!{
        didSet { quantitytxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var bookingDatetxt: UITextField!
    @IBOutlet weak var bookingDate: UIDatePicker!
    @IBAction func bookingDatePicker(_ sender: UIDatePicker) {
        dateValue.dateFormat = "YYYY-MM-dd" // 設定要顯示在Text Field的日期時間格式
        bookingDateValue = bookingDate.date.hashValue
        bookingDatetxt.text = dateValue.string(from: bookingDate.date) // 更新Text Field的內容
    }
    
    @IBOutlet weak var returnDatetxt: UITextField!
    @IBOutlet weak var returnDate: UIDatePicker!
    @IBAction func returnDatePicker(_ sender: UIDatePicker) {
        dateValue.dateFormat = "YYYY-MM-dd" // 設定要顯示在Text Field的日期時間格式
        returnDateValue = returnDate.date.hashValue
        returnDatetxt.text = dateValue.string(from: returnDate.date) // 更新Text Field的內容
    }
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movietxt.delegate = self
        customertxt.delegate = self
        quantitytxt.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if(title == "Edit Booking Details"){
            movietxt.text = booking.movie?.name
            customertxt.text = booking.customer?.name
            quantitytxt.text = String(booking.quantity!)
            bookingDatetxt.text = booking.bookingDate!
            returnDatetxt.text = booking.returnDate!
        }
        button.setTitle(btnTitle, for:.normal)
    }
    
    @IBAction func button(_ sender: UIButton) {
        let movie = movietxt.text
        let customer = customertxt.text
        let quantity = quantitytxt.text
        let bookingDate = bookingDatetxt.text
        let returnDate = returnDatetxt.text
        
            if(movie == "" || customer == "" || quantity == "" || bookingDate == "" || returnDate == ""){
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
            }else if(bookingDateValue >= returnDateValue){
                let alertController = UIAlertController(title: "Error:", message: "Booking Date must be smaller than Return Date", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                bookingDatetxt.text = ""
                returnDatetxt.text = ""
            }else if(title == "Edit Booking Details"){
                for item in AppDelegate.BookingList{
                    if(item.id == booking.id){
                        item.movie = Movie.FindMovie(name:movie!)!
                        item.customer = Customer.FindCustomer(name:customer!)!
                        item.quantity = Int(quantity!)!
                        item.bookingDate = bookingDate!
                        item.returnDate = returnDate!
                    }
                }
            }else{
                if((Booking.ExistedBooking(movie: movie!, customer: customer!, quantity: Int(quantity!)!, bookingDate: bookingDate!, returnDate: returnDate!)) != nil){
                let alertController = UIAlertController(title: "Error:", message: "\(movie!) Booking for \(customer!) is already existed!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                    alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                    
                }else{
                    let m = Movie.FindMovie(name: movie!)!
                    let c = Customer.FindCustomer(name: customer!)!
                    let booking = Booking(BookingDate: bookingDate!, ReturnDate: returnDate!, Customer:c , Movie:m , Quantity: Int(quantity!)!)
                    m.quantity -= Int(quantity!)!
                    AppDelegate.BookingList.append(booking)
                }
                movietxt.text = ""
                customertxt.text = ""
                quantitytxt.text = ""
                bookingDatetxt.text = ""
                returnDatetxt.text = ""
            }
        self.navigationController?.popViewController(animated: true)
        }
    
    //keyboard setting
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        movietxt.resignFirstResponder()
        customertxt.resignFirstResponder()
        quantitytxt.resignFirstResponder()
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
