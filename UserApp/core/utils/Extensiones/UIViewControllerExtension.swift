//
//  UIViewController.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import Foundation
import UIKit


extension UIViewController {
    
    
    /**
     Metodo que inicializa la barra de navegacion
     - Author: spinilla
     */
    func initNavigationBar(color:UIColor = UIColor(named: "txt_color")!){
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.tintColor = color
        navigationController?.view.backgroundColor = color
        
        /* Codigo que permite cambiar el icono de back por defecto
         navigationController?.navigationBar.backIndicatorImage = UIImage(named: "btn_volver")
         navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "btn_volver")
         navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
         */
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,
                              NSAttributedString.Key.font: UIFont(name: "Arial", size: 21)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    
}

