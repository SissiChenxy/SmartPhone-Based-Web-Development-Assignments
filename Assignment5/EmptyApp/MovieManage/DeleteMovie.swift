//
//  DeleteMovie.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit
class DeleteMovie: UIView{
    var deleteMovieView = UIView()
    let uiCreation = UICreation()
    var nameInputField = UITextField()
    @objc let displayMovie = DisplayMovie()
    
    func initDeleteMovie(){
        deleteMovieView = UIView(frame: AppDelegate.homeViewRect)
        deleteMovieView.backgroundColor = UIColor.white
        deleteMovieView.isHidden = true
        AppDelegate.homeView.addSubview(deleteMovieView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 130, yValue: 150, width: 300, height: 30, text: "Delete Movie")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        deleteMovieView.addSubview(titleLabel)
        
        //name
        let nameLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 250, width: 50, height: 30, text: "Name: ")
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        deleteMovieView.addSubview(nameLabel)
        
        nameInputField = uiCreation.createTextField(xValue: 59, yValue: 280, width: 300, height: 30, placeHolder: "Enter Name", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        deleteMovieView.addSubview(nameInputField)
        
        //add button
        let displayBtn:UIButton = createButton(xValue: 83, yValue: 716, width: 250, height: 30, title:"Display Movie", color: UIColor.brown, action: #selector(displayMovies))
        deleteMovieView.addSubview(displayBtn)
        
        let deleteBtn:UIButton = createButton(xValue: 83, yValue: 766, width: 250, height: 30, title:"Delete Movie", color: UIColor.brown, action: #selector(deleteMovie))
        deleteMovieView.addSubview(deleteBtn)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Previous", color: UIColor.brown, action: #selector(returnToMenu))
        deleteMovieView.addSubview(returnBtn)
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
    
    @objc func deleteMovie() {
        let name = nameInputField.text
        if(name == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input the value!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else if(Movie.ExistedMovie(name: name!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "\(name!) isn't existed in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            nameInputField.text = ""
        }else {
            for i in 0...AppDelegate.MovieList.count{
                if(AppDelegate.MovieList[i].name == name){
                    AppDelegate.MovieList.remove(at: i)
                    break
                }
            }
            let alert = UIAlertView()
            alert.title = "Success: "
            alert.message = "\(name!) is deleted in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            deleteMovieView.isHidden = true
            displayMovies()
            nameInputField.text = ""
        }
    }
    
    func ExistedMovie(name:String) -> Movie?{
        for Movie in AppDelegate.MovieList{
            if(Movie.name==name){
                return Movie
            }
        }
        return nil
    }
    
    @objc func returnToMenu(){
        deleteMovieView.isHidden = true
    }
    
    @objc func displayMovies(){
        displayMovie.initDisplayMovie()
        displayMovie.displayMovieView.isHidden = false
    }
}

