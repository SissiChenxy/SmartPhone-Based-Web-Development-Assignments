//
//  DisplayMovie.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit

class DisplayMovie: UIView{
    var displayMovieView = UIView()
    var MovieListView = UITextView()
    let uiCreation = UICreation()
    
    func initDisplayMovie(){
        displayMovieView = UIView(frame: AppDelegate.homeViewRect)
        displayMovieView.backgroundColor = UIColor.white
        displayMovieView.isHidden = true
        AppDelegate.homeView.addSubview(displayMovieView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 80, yValue: 150, width: 300, height: 30, text: "Display All Movies")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        displayMovieView.addSubview(titleLabel)
        
        MovieListView = UITextView(frame:(CGRect(x:50, y:230, width: 300, height: 500)))
        MovieListView.isEditable = false
        MovieListView.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        //name
        var result: String = ""
        for item in AppDelegate.MovieList{
            result += "Id: \(item.id) \n"
            result += "Name: \(item.name) \n"
            result += "Release Year: \(item.releaseYear) \n"
            result += "Type: \(item.type) \n"
            result += "Quantity: \(item.quantity) \n"
            result += "----------------------------------- \n"
            MovieListView.text = result
        }
        displayMovieView.addSubview(MovieListView)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Menu", color: UIColor.brown, action: #selector(returnToMenu))
        displayMovieView.addSubview(returnBtn)
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
    
    func returnToMenu(){
        displayMovieView.isHidden = true
    }
    
}
