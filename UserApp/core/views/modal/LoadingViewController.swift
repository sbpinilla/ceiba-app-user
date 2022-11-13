//
//  LoadingViewController.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import UIKit
import SwiftGifOrigin

/**
 Controlador de la vista LoadingViewController disponible en DialogCargando.storyboard
 - Author: spinilla
 */
class LoadingViewController: UIViewController{
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var viewLoading: UIImageView!
    
    /**
     Metodo que se ejecuta antes que la interfaz se presente al usuario,es usado como inicializador
     - Author: spinilla
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoading.loadGif(name:"load")
        setupView()
        animateView()
        
    }
    
}

/**
 Extension de la clase LoadingViewController
 - Author: spinilla
 */
extension LoadingViewController {
    
    /**
     Metodo usado para inicializar los controles de la interfaz
     - Author: spinilla
     */
    func setupView(){
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    /**
     Metodo encargado de animar el viewController como modal
     - Author: spinilla
     */
    func animateView() {
        viewLoading.alpha = 0;
        self.viewLoading.frame.origin.y = self.viewLoading.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.viewLoading.alpha = 1.0;
            self.viewLoading.frame.origin.y = self.viewLoading.frame.origin.y - 50
        })
    }
    
}
