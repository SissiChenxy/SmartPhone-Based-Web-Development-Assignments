//
//  ViewController.swift
//  Assignment9
//
//  Created by 陈昕昀 on 3/28/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,NSFetchedResultsControllerDelegate {
    let movieService = MovieService()
    let customerService = CustomerService()
    let bookingService = BookingService()

    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.shared.delegate as! AppDelegate
        let managedContext = app.persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
//        let m1 = movieService.saveMovie(name: "Bohemian Rhapsody", type: "Music", quantity: 5, img: UIImage(named: "bohemian.jpg")!.pngData()!, releaseYear: 2018, managedContext: managedContext)
//        let m2 = movieService.saveMovie(name: "Captain Marvel", type: "Action", quantity: 3, img: UIImage(named: "captain_marvel.jpg")!.pngData()!, releaseYear: 2018, managedContext: managedContext)
//        let m3 = movieService.saveMovie(name:"Bumble Bee", type:"Adventure" , quantity:5, img:UIImage(named: "bumblebee.jpg")!.pngData()!,releaseYear:2018, managedContext: managedContext)
//        let m4 = movieService.saveMovie(name:"Superman", type: "Adventure", quantity:6, img:UIImage(named: "superman.jpg")!.pngData()!,releaseYear:1978, managedContext: managedContext)
//        let m5 = movieService.saveMovie(name:"Aquaman", type: "Adventure", quantity:1, img:UIImage(named: "aquaman.jpeg")!.pngData()!,releaseYear:2018, managedContext: managedContext)
//        movieService.movieList.append(m1)
//        movieService.movieList.append(m2)
//        movieService.movieList.append(m3)
//        movieService.movieList.append(m4)
//        movieService.movieList.append(m5)
//
//        let c1 = customerService.saveCustomer(name: "Sissi", email: "871513123@qq.com", age: 22, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
//        let c2 = customerService.saveCustomer(name: "Nancy", email: "nancy@gmail.com", age: 12, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
//        let c3 = customerService.saveCustomer(name: "Lily", email: "lily@163.com", age: 18, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
//        let c4 = customerService.saveCustomer(name: "Sue", email: "sue@163.com", age: 17, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
//        let c5 = customerService.saveCustomer(name: "Susan", email: "susan@163.com", age: 21, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "YYYY-MM-dd"
//        let b1 = bookingService.saveBooking(movie:m1, customer: c1, quantity: Int16(2), bookingDate: dateFormatter.date(from: "2018-09-23")!, returnDate: dateFormatter.date(from: "2018-10-03")!, managedContext: managedContext)
//        let b2 = bookingService.saveBooking(movie:m2, customer: c2, quantity: Int16(3), bookingDate: dateFormatter.date(from: "2018-03-11")!, returnDate: dateFormatter.date(from: "2018-03-24")!, managedContext: managedContext)
//
//
//        print("bookings in system")
//        let bookings = bookingService.getBookings(managedContext: managedContext).fetchedObjects!
//        for i in bookings{
//            print("movie")
//            print(i.movie?.name)
//            print("customer")
//            print(i.customer?.name)
//        }
        
    }


}

