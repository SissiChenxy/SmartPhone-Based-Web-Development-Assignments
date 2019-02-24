//
//  ManageMovie.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageMovie: UIView{
    var movieManageView = UIView()
    
    let uiCreation = UICreation()
    let addMovie = AddMovie()
    let displayMovie = DisplayMovie()
    let deleteMovie = DeleteMovie()
    
    //buttons on movie manage page
    func initManageMovie(){
        movieManageView = UIView(frame: AppDelegate.homeViewRect)
        movieManageView.backgroundColor = UIColor.white
        movieManageView.isHidden = true
        AppDelegate.homeView.addSubview(movieManageView)
        
        let addMovieBtn:UIButton = createButton(xValue: 107, yValue: 300, width: 200, height: 30, title: "Add Movie", color: UIColor.brown, action:#selector(showAddMovieView))
        movieManageView.addSubview(addMovieBtn)
        
        let deleteMovieBtn:UIButton = createButton(xValue: 107, yValue: 380, width: 200, height: 30, title: "Delete Movie", color: UIColor.brown, action:#selector(showDeleteMovieView))
        movieManageView.addSubview(deleteMovieBtn)
        
        let displayMovieBtn:UIButton = createButton(xValue: 107, yValue: 460, width: 200, height: 30, title: "Display Movie", color: UIColor.brown,action:#selector(showDisplayMovieView))
        movieManageView.addSubview(displayMovieBtn)
        
        let backBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title: "Back to Home Page", color: UIColor.brown,action:#selector(showHomeView))
        movieManageView.addSubview(backBtn)
        
        addMovie.initAddMovie()
        displayMovie.initDisplayMovie()
        deleteMovie.initDeleteMovie()
    }
    
    func createButton(xValue:Double, yValue:Double,width:Double,height:Double,title:String,color:UIColor,action:Selector) -> UIButton {
        let button: UIButton = UIButton(type:.roundedRect)
        button.frame = CGRect(x:xValue,y:yValue,width:width,height:height)
        button.layer.cornerRadius = CGFloat(height / 2)
        button.setTitle(title, for: UIControlState.normal)
        button.backgroundColor = color
        button.setTitleColor(UIColor.white,for: UIControlState.normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(height-10))
        return button
    }
    
    //show add movie view
    @objc func showAddMovieView() {
        addMovie.addMovieView.isHidden = false
    }
    //show delete movie view
    @objc func showDeleteMovieView() {
        deleteMovie.deleteMovieView.isHidden = false
    }
    
    @objc func showDisplayMovieView() {
        displayMovie.displayMovieView.isHidden = false
    }
    
    @objc func showHomeView() {
        movieManageView.isHidden = true
    }
}
