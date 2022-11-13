//
//  CardView.swift
//  autogestion
//
//  Created by Sergio pinilla on 2/13/20.
//  Copyright © 2020 Sergio pinilla. All rights reserved.
//

import Foundation
import UIKit

/**
 Clase que nos permite emular el card view nativo de android
 - Author: spinilla
*/
class CardView: UIView {
    
@IBInspectable var cornerRadius: CGFloat = 2
   
   @IBInspectable var shadowOffsetWidth: Int = 0
   @IBInspectable var shadowOffsetHeight: Int = 1
   @IBInspectable var shadowColor: UIColor? = UIColor.black
   @IBInspectable var shadowOpacity: Float = 0.5
   
   override func layoutSubviews() {
       layer.cornerRadius = cornerRadius
       let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
       
       layer.masksToBounds = false
       layer.shadowColor = shadowColor?.cgColor
       layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
       layer.shadowOpacity = shadowOpacity
       layer.shadowPath = shadowPath.cgPath
   }

}
