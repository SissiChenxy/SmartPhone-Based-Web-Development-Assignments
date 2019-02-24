//
//  AddMovie.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit

class AddMovie : UIView{
    var addMovieView = UIView()
    let uiCreation = UICreation()
    var nameInputField = UITextField()
    var yearInputField = UITextField()
    var typeInputField = UITextField()
    var quantityInputField = UITextField()
    let displayMovie = DisplayMovie()
    
    
    func initAddMovie(){
        addMovieView = UIView(frame: AppDelegate.homeViewRect)
        addMovieView.backgroundColor = UIColor.white
        addMovieView.isHidden = true
        AppDelegate.homeView.addSubview(addMovieView)
        
        let titleLabel: UILabel = uiCreation.createLabel(xValue: 80, yValue: 150, width: 300, height: 30, text: "Add Customer Details")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        addMovieView.addSubview(titleLabel)
        
        //name
        let nameLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 250, width: 50, height: 30, text: "Name: ")
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addMovieView.addSubview(nameLabel)
        
        nameInputField = uiCreation.createTextField(xValue: 59, yValue: 280, width: 300, height: 30, placeHolder: "Enter Name", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addMovieView.addSubview(nameInputField)
        
        //year
        let yearLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 330, width: 100, height: 30, text: "Release Year: ")
        yearLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addMovieView.addSubview(yearLabel)
        
        yearInputField = uiCreation.createTextField(xValue: 59, yValue: 360, width: 300, height: 30, placeHolder: "Enter Year", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addMovieView.addSubview(yearInputField)
        
        //type
        let typeLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 410, width: 50, height: 30, text: "Type: ")
        typeLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addMovieView.addSubview(typeLabel)
        
        typeInputField = uiCreation.createTextField(xValue: 59, yValue: 440, width: 300, height: 30, placeHolder: "Enter Type", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addMovieView.addSubview(typeInputField)
        
        //quantity
        let quantityLabel: UILabel = uiCreation.createLabel(xValue: 59, yValue: 490, width: 100, height: 30, text: "Quantity: ")
        quantityLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        addMovieView.addSubview(quantityLabel)
        
        quantityInputField = uiCreation.createTextField(xValue: 59, yValue: 520, width: 300, height: 30, placeHolder: "Enter Quantity", textAlignment: NSTextAlignment.center, textColor: UIColor.blue)
        addMovieView.addSubview(quantityInputField)
        
        //add button
        let addBtn:UIButton = createButton(xValue: 83, yValue: 756, width: 250, height: 30, title:"Add Movie", color: UIColor.brown, action: #selector(addMovie))
        addMovieView.addSubview(addBtn)
        
        //return button
        let returnBtn:UIButton = createButton(xValue: 83, yValue: 816, width: 250, height: 30, title:"Return to Menu", color: UIColor.brown, action: #selector(returnToMenu))
        addMovieView.addSubview(returnBtn)
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
    
    func addMovie(){
        let name = nameInputField.text
        let year = yearInputField.text
        let type = typeInputField.text
        let quantity = quantityInputField.text
        if(name == "" || year == "" || type == "" || quantity == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input the value!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else if(Int(year!) == nil || Int(quantity!) == nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "The year and quantity should be Integer!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
            if(Int(year!) == nil){
                yearInputField.text = ""
            }
            if(Int(quantity!) == nil){
                quantityInputField.text = ""
            }
        }else if(Movie.ExistedMovie(name: name!) != nil){
            let alert = UIAlertView()
            alert.title = "Error: "
            alert.message = "\(name!) is existed in the system!"
            alert.addButton(withTitle: "Edit it!")
            alert.show()
        }else{
            let m = Movie(Name: name!, ReleaseYear: Int(year!)!, Type: type!, Quantity: Int(quantity!)!)
            AppDelegate.MovieList.append(m)
            let alert = UIAlertView()
            alert.title = "Success: "
            alert.message = "\(name!) is added in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
            displayMovies()
            nameInputField.text = ""
            yearInputField.text = ""
            typeInputField.text = ""
            quantityInputField.text = ""
        }
    }
    
    func returnToMenu(){
        addMovieView.isHidden = true
    }
    
    func displayMovies(){
        addMovieView.isHidden = true
        displayMovie.initDisplayMovie()
        displayMovie.displayMovieView.isHidden = false
    }

}
