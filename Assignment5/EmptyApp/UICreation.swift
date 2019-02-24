//
//  UICreation.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
import UIKit

class UICreation{
    func createLabel(xValue:Double, yValue:Double,width:Double,height:Double,text:String) -> UILabel {
        let label:UILabel = UILabel(frame:CGRect(x:xValue,y:yValue,width:width,height:height))
        label.text = text
        return label
    }
    
    func createTextField(xValue:Double, yValue:Double,width:Double,height:Double,placeHolder:String,textAlignment:NSTextAlignment,textColor:UIColor) -> UITextField {
        let textField = UITextField(frame: CGRect(x:xValue,y:yValue,width:width,height:height))
        textField.textAlignment = textAlignment
        textField.textColor = textColor
        textField.backgroundColor = UIColor.white
        textField.borderStyle = UITextBorderStyle.line
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.clearButtonMode = .whileEditing
        textField.placeholder = placeHolder
        textField.keyboardType = .default
        textField.returnKeyType = .done
        
        return textField
    }
    
    func createTextView(xValue:Double, yValue:Double,width:Double,height:Double) -> UITextView {
        let textView = UITextView(frame: CGRect(x:xValue,y:yValue,width:width,height:height))
        textView.isEditable = false
        textView.font = UIFont.boldSystemFont(ofSize: 18.0)
        return textView
    }
    

}
