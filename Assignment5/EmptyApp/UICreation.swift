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
    
    func createButton(xValue:Double, yValue:Double,width:Double,height:Double,title:String,color:UIColor,action:Selector) -> UIButton {
        let button: UIButton = UIButton(frame:CGRect(x:xValue,y:yValue,width:width,height:height))
        button.setTitle(title, for: UIControlState.normal)
        button.backgroundColor = color
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func createTextField(xValue:Double, yValue:Double,width:Double,height:Double,placeHolder:String) -> UITextField {
        let textField = UITextField(frame: CGRect(x:xValue,y:yValue,width:width,height:height))
        textField.textAlignment = NSTextAlignment.center
        return textField
    }
}
