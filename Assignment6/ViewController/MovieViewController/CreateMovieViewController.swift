//
//  CreateMovieViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/1/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class CreateMovieViewController: UIViewController {

    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var releaseYeartxt: UITextField!{
        didSet { releaseYeartxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var typetxt: UITextField!
    @IBOutlet weak var quantitytxt: UITextField!{
        didSet { quantitytxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var viewTitle: UILabel!
    
    @IBOutlet weak var createBtn: UIButton!
    
    @IBAction func createMovie(_ sender: UIButton) {
        let name = nametxt.text
        let year = releaseYeartxt.text
        let type = typetxt.text
        let quantity = quantitytxt.text
        if (viewTitle.text == "Update Movie"){
            let updateMovieController = presentingViewController as? UpdateMovieViewController
            let m = Movie.FindMovie(name: updateMovieController!.nametxt.text!)
            for item in AppDelegate.MovieList{
                if(item.id == m!.id){
                    item.name = name!
                    item.releaseYear = Int(year!)!
                    item.type = type!
                    item.quantity = Int(quantity!)!
                }
            }
            updateMovieController!.nametxt.text = ""
            let alertController = UIAlertController(title: "Success:", message: "\(name!) is updated in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            nametxt.text = ""
            releaseYeartxt.text = ""
            typetxt.text = ""
            quantitytxt.text = ""
        }else if(name == "" || year == "" || type == "" || quantity == ""){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else if(Int(year!) == nil || Int(quantity!) == nil){
            let alertController = UIAlertController(title: "Error:", message: "The year and quantity should be Integer!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            if(Int(year!) == nil){
                releaseYeartxt.text = ""
            }
            if(Int(quantity!) == nil){
                quantitytxt.text = ""
            }
        }else if(Movie.ExistedMovie(name: name!,year: Int(year!)!,type: type!,quantity: Int(quantity!)!) != nil){
            let alertController = UIAlertController(title: "Error:", message: "\(name!) is existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            let m = Movie(Name: name!, ReleaseYear: Int(year!)!, Type: type!, Quantity: Int(quantity!)!)
            AppDelegate.MovieList.append(m)
            let alertController = UIAlertController(title: "Success:", message: "\(name!) is added in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Got it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
            nametxt.text = ""
            releaseYeartxt.text = ""
            typetxt.text = ""
            quantitytxt.text = ""
        }
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
