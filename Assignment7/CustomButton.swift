//
//  CustomButton.swift
//  assignment6
//
//  Created by 陈昕昀 on 3/2/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit
@IBDesignable class CustomButton : UIButton{
    @IBInspectable var borderCorner: CGFloat = 15.0{
        didSet{
            self.layer.cornerRadius = borderCorner
        }
    }
    @IBInspectable var borderThickness:CGFloat = 2.0{
        didSet{
            self.layer.borderWidth = borderThickness
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.white{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
