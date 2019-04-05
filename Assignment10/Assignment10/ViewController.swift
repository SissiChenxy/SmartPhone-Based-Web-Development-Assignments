//
//  ViewController.swift
//  Assignment10
//
//  Created by 陈昕昀 on 4/3/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let movieService = MovieService()
    let customerService = CustomerService()
    let bookingService = BookingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.shared.delegate as! AppDelegate
        let managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
        
        if(customerService.isCustomerCoreDataEmpty(entity: "Customer", managedContext: managedContext) == 0){
            let c1 = customerService.saveCustomer(name: "Sissi", email: "871513123@qq.com", age: 22, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
            let c2 = customerService.saveCustomer(name: "Nancy", email: "nancy@gmail.com", age: 12, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
            let c3 = customerService.saveCustomer(name: "Lily", email: "lily@163.com", age: 18, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
            let c4 = customerService.saveCustomer(name: "Sue", email: "sue@163.com", age: 17, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
            let c5 = customerService.saveCustomer(name: "Susan", email: "susan@163.com", age: 21, address: "360 Huntington Ave, Boston, MA, 02215",managedContext:managedContext)
        }
        
        
        let movieNames:[String] = ["aquaman","bumblebee","avengers"]
        
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
        }else{
            print("Internet Connection not Available!")
        }
        
        if(movieService.isMovieCoreDataEmpty(entity: "Movie", managedContext: managedContext) == 0){
            for name in movieNames{
                let urlString = "http://www.omdbapi.com/?apikey=9e62984a&t="+name
                guard let url = URL(string: urlString) else { return }
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                    guard let data = data else { return }
                    //Implement JSON decoding and parsing
                    do {
                        //Decode retrived data with JSONDecoder and assing type of MovieModel object
                        let movieData = try JSONDecoder().decode(MovieModel.self, from: data)
                        
                        //Get back to the main queue
                        DispatchQueue.main.async {
                            if let url = URL.init(string: movieData.Poster){
                                do {
                                    let imageData = try Data(contentsOf: url)
                                    self.movieService.saveMovie(name: movieData.Title, type: movieData.Genre, quantity: Int16(7), img: imageData, releaseYear: Int16(movieData.Year)!, managedContext: managedContext)
                                }catch{
                                    print(error)
                                }
                            }
                        }
                    }catch let parsingError {
                        print(parsingError)
                    }
                    }.resume()
            }
        }
    }

}

