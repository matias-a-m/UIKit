//
//  CustomView.swift
//  14.Storyboard
//
//  Created by matias on 23/12/2023.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable
    var buttonBackgroundColor: UIColor = .blue {
        didSet{
            backgroundColor = buttonBackgroundColor
        }
    }
    
    @IBInspectable
    var buttonBorderWidth: CGFloat = 10.0 {
        didSet{
            layer.borderWidth = buttonBorderWidth
        }
    }
    
    @IBInspectable
    var buttonBorderColor: UIColor = .black{
        didSet{
            layer.borderColor = buttonBorderColor.cgColor
        }
    }

    override func prepareForInterfaceBuilder() {
        backgroundColor = buttonBackgroundColor
        layer.borderWidth = buttonBorderWidth
        layer.borderColor = buttonBorderColor.cgColor
    }
    
}
