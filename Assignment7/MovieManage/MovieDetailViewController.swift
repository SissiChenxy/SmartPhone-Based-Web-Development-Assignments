//
//  MovieDetailViewController.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/16/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var movie = Movie()
    var btnTitle = ""
    let pickerController = UIImagePickerController()
    
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var releaseYeartxt: UITextField!{
        didSet { releaseYeartxt?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var typetxt: UITextField!
    @IBOutlet weak var quantitytxt: UITextField!{
        didSet { quantitytxt?.addDoneCancelToolbar() }
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var button: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        nametxt.delegate = self
        releaseYeartxt.delegate = self
        quantitytxt.delegate = self
        typetxt.delegate = self
        pickerController.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if(title == "Edit Movie Details"){
            nametxt.text = movie.name
            releaseYeartxt.text = String(movie.releaseYear)
            quantitytxt.text = String(movie.quantity)
            typetxt.text = movie.type
            image.image = movie.img
            
        }
        button.setTitle(btnTitle, for:.normal)
    }
    
    @IBAction func upload(_ sender: Any) {
        
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage {
            image.image = img
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func button(_ sender: UIButton) {
        let name = nametxt.text
        let year = releaseYeartxt.text
        let type = typetxt.text
        let quantity = quantitytxt.text
        let img = image.image
        
        if(img == nil){
            let alertController = UIAlertController(title: "Alert:", message: "You need to upload an image!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
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
            }else if(title == "Edit Movie Details"){
                for item in AppDelegate.MovieList{
                    if(item.id == movie.id){
                        item.name = name!
                        item.releaseYear = Int(year!)!
                        item.type = type!
                        item.quantity = Int(quantity!)!
                    }
                }
            }else{
            if(Movie.ExistedMovie(name: name!,year: Int(year!)!,type: type!,quantity: Int(quantity!)!,image: img!) != nil){
                    let alertController = UIAlertController(title: "Error:", message: "\(name!) is existed in the system!", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let m = Movie(Name: name!, ReleaseYear: Int(year!)!, Type: type!, Quantity: Int(quantity!)!, Image: img!)
                    AppDelegate.MovieList.append(m)
                }
                nametxt.text = ""
                releaseYeartxt.text = ""
                typetxt.text = ""
                quantitytxt.text = ""
                image.image = nil
            }
        self.navigationController?.popViewController(animated: true)
        }
    
    
    //keyboard setting
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        nametxt.resignFirstResponder()
        releaseYeartxt.resignFirstResponder()
        quantitytxt.resignFirstResponder()
        typetxt.resignFirstResponder()
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
