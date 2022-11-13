//
//  UITextFieldExtension.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import Foundation
import UIKit
/**
 Extension de la clase CALayer
 - Author: spinilla
 */

extension UITextField {
    
    /**
     Metodo que nos permite cambiar el color del placeholder
     - Author: spinilla
     */
    func placeholderColor(_ color: UIColor){
        var placeholderText = ""
        if self.placeholder != nil{
            placeholderText = self.placeholder!
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
}
