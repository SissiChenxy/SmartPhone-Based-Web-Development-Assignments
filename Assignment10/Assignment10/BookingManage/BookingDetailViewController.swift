//
//  BookingDetailViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit
import CoreData

class BookingDetailViewController: UIViewController,UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate {
    
    var booking = Booking()
    var btnTitle = ""
    var bookingDateValue = 0
    var returnDateValue = 0
    var dateFormatter = DateFormatter()
    let movieService = MovieService()
    let customerService = CustomerService()
    let bookingService = BookingService()

    var managedContext : NSManagedObjectContext!
    
    
    @IBOutlet weak var movietxt: UITextField!
    @IBOutlet weak var moviecustomerpicker: UIPickerView!
    @IBOutlet weak var customertxt: UITextField!
    @IBOutlet weak var quantitytxt: UITextField!{
        didSet { quantitytxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var bookingDatetxt: UITextField!
    @IBOutlet weak var bookingDate: UIDatePicker!
    @IBAction func bookingDatePicker(_ sender: UIDatePicker) {
        //dateFormatter.dateFormat = "YYYY-MM-dd" // 設定要顯示在Text Field的日期時間格式
        bookingDateValue = bookingDate.date.hashValue
        bookingDatetxt.text = dateFormatter.string(from: bookingDate.date) // 更新Text Field的內容
    }
    
    @IBOutlet weak var returnDatetxt: UITextField!
    @IBOutlet weak var returnDate: UIDatePicker!
    @IBAction func returnDatePicker(_ sender: UIDatePicker) {
        returnDateValue = returnDate.date.hashValue
        returnDatetxt.text = dateFormatter.string(from: returnDate.date) // 更新Text Field的內容
    }
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quantitytxt.delegate = self
        dateFormatter.dateFormat = "YYYY-MM-dd"
        moviecustomerpicker.dataSource = self as UIPickerViewDataSource
        moviecustomerpicker.delegate = self as! UIPickerViewDelegate
        // Do any additional setup after loading the view.
        moviecustomerpicker.selectRow(0,inComponent:0,animated:true)
        moviecustomerpicker.selectRow(0,inComponent:1,animated:true)
        moviecustomerpicker.reloadAllComponents()

        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
    }
    override func viewDidAppear(_ animated: Bool) {
        if(title == "Edit Booking Details"){
            movietxt.text = booking.movie?.name
            customertxt.text = booking.customer?.name
            quantitytxt.text = String(booking.quantity)
            bookingDatetxt.text = dateFormatter.string(from: booking.bookingDate!)
            returnDatetxt.text = dateFormatter.string(from: booking.returnDate!)
        
            bookingDate.setDate(dateFormatter.date(from: bookingDatetxt.text!)!, animated: false)
            returnDate.setDate(dateFormatter.date(from: returnDatetxt.text!)!, animated: false)
            bookingDateValue = bookingDatetxt.hashValue
            returnDateValue = returnDatetxt.hashValue
        }
        button.setTitle(btnTitle, for:.normal)
    }
    
    //列数
    func numberOfComponents(in moviecustomerpicker: UIPickerView) -> Int {
        return 2
    }
    
    //行数
    func pickerView(_ moviecustomerpicker: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        if 0 == component {
            return movieService.getMovies(managedContext: managedContext).count
        }else {
            guard let customers = customerService.getCustomers(managedContext: managedContext).fetchedObjects else {return 0}
            return customers.count
        }
    }
    
    //内容
    func pickerView(_ moviecustomerpicker: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        if 0 == component {
            return movieService.getMovies(managedContext: managedContext)[row].name
        }else {
            return customerService.getCustomers(managedContext: managedContext).fetchedObjects![row].name
        }
    }
    
    func pickerView(_ moviecustomerpicker: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if 0 == component {
            movietxt.text = movieService.movieList[moviecustomerpicker.selectedRow(inComponent: 0)].name
        }else {
            let customerList = customerService.getCustomers(managedContext: managedContext).fetchedObjects
            customertxt.text = customerList![moviecustomerpicker.selectedRow(inComponent: 1)].name
        }
    }
    
    @IBAction func button(_ sender: UIButton) {
        let mid = moviecustomerpicker.selectedRow(inComponent: 0)
        let movie = movieService.movieList[mid]
        
        let cid = moviecustomerpicker.selectedRow(inComponent: 1)
        let customer = customerService.getCustomers(managedContext: managedContext).fetchedObjects![cid]
        let quantity = quantitytxt.text
        let bookingDateStr = bookingDatetxt.text
        let bookingDate = dateFormatter.date(from: bookingDateStr!)
        let returnDateStr = returnDatetxt.text
        let returnDate = dateFormatter.date(from: returnDateStr!)
        
        if(movie == nil || customer == nil || quantity == "" || bookingDateStr == "" || returnDateStr == ""){
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
        }else if((movieService.FindMovie(movie: movie)?.quantity)! < Int16(quantity!)!){
            let alertController = UIAlertController(title: "Error:", message: "\(movie) only has \(movie.quantity) in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            quantitytxt.text = ""
        }else if(bookingDateValue >= returnDateValue){
                print(bookingDateValue)
                print(returnDateValue)
                let alertController = UIAlertController(title: "Error:", message: "Booking Date must be smaller than Return Date", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                bookingDatetxt.text = ""
                returnDatetxt.text = ""
        }else{
            if(title == "Edit Booking Details"){
                booking.movie = movie
                booking.customer = customer
                booking.quantity = Int16(quantity!)!
                booking.bookingDate = bookingDate!
                booking.returnDate = returnDate!
                bookingService.saveContext(managedContext: managedContext)
                print(bookingDateValue)
                print(returnDateValue)
            }else{
                bookingService.saveBooking(movie: movie, customer: customer, quantity: Int16(quantity!)!, bookingDate: bookingDate!, returnDate: returnDate!, managedContext: managedContext)
            }
        }
            quantitytxt.text = ""
            bookingDatetxt.text = ""
            returnDatetxt.text = ""
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
