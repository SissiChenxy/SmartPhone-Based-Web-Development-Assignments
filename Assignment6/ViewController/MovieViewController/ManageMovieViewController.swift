//
//  ManageMovieViewController.swift
//  assignment6
//
//  Created by 陈昕昀 on 2/28/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

class ManageMovieViewController: UIViewController {

    
    @IBAction func createMovieView(_ sender: UIButton) {
        let createMovieController = CreateMovieViewController(nibName:"CreateMovieView",bundle:nil)
        createMovieController.modalTransitionStyle = .flipHorizontal
        self.present(createMovieController, animated: true, completion: nil)
    }
    @IBAction func deleteMovieView(_ sender: UIButton) {
        let deleteMovieController = DeleteMovieViewController(nibName:"DeleteMovieView",bundle:nil)
        deleteMovieController.modalTransitionStyle = .flipHorizontal
        self.present(deleteMovieController, animated: true, completion: nil)
    }
    @IBAction func updateMovie(_ sender: UIButton) {
        let updateMovieController = UpdateMovieViewController(nibName:"UpdateMovieView",bundle:nil)
        updateMovieController.modalTransitionStyle = .flipHorizontal
        self.present(updateMovieController, animated: true, completion: nil)
    }
    @IBAction func displayMovieView(_ sender: UIButton) {
        let displayMovieController = DisplayMovieViewController(nibName:"DisplayMovieView",bundle:nil)
        displayMovieController.modalTransitionStyle = .flipHorizontal
        self.present(displayMovieController, animated: true, completion: nil)
    }
    @IBAction func returnToHome(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
