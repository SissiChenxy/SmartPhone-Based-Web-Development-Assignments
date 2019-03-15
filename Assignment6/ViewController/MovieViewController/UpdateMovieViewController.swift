//
//  UpdateMovieViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/3/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class UpdateMovieViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var nametxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nametxt.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateMovie(_ sender: UIButton) {
        let name = nametxt.text
        
        if(name == ""){
            let alertController = UIAlertController(title: "Alert:", message: "You need to input the value!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }else if(Movie.FindMovie(name: name!) == nil) {
            let alertController = UIAlertController(title: "Alert:", message: "\(name!) isn't existed in the system!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Edit it!", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            
        }else {
            let createMovieController = CreateMovieViewController(nibName:"CreateMovieView",bundle:nil)
            createMovieController.modalTransitionStyle = .flipHorizontal
            present(createMovieController, animated: true, completion: nil)
            if let updateVC = presentedViewController as? CreateMovieViewController, name != ""{
                let m = Movie.FindMovie(name: name!)
                updateVC.nametxt.text = m!.name
                updateVC.releaseYeartxt.text = String(m!.releaseYear)
                updateVC.typetxt.text = m!.type
                updateVC.quantitytxt.text = String(m!.quantity)
                updateVC.viewTitle.text = "Update Movie"
                updateVC.createBtn.setTitle("Save Changes", for: .normal)
            }
        }
    }
    @IBAction func displayMovie(_ sender: UIButton) {
        let displayMovieController = DisplayMovieViewController(nibName:"DisplayMovieView",bundle:nil)
        displayMovieController.modalTransitionStyle = .flipHorizontal
        self.present(displayMovieController, animated: true, completion: nil)
    }
    @IBAction func backToPrevious(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
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
