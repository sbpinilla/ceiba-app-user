//
//  Utils.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import Foundation
import UIKit
import CoreData
import ObjectMapper


/**
 Utilidades transversales a la aplicacion
 - Author: spinilla
 */
class Utils {
    
    /**
     Metodo que nos permite visualizar la vista de cargando
     - Author: spinilla
     */
    static func showLoadView() -> LoadingViewController{
        
        let storyboard = UIStoryboard(name: StoryBoard.dialogCargando.rawValue, bundle: nil)
        
        let customAlert = storyboard.instantiateViewController(withIdentifier: VCReferencias.dialogCargando.rawValue) as! LoadingViewController
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        return customAlert
        
    }
    
    
    /**
     Funcion que nos permite obtener la instaciona del ManagedObjectContext el cual es necesario para interactura con la base de datos local "Core Data"
     - Author: spinilla
     */
    static func getManagedContext () ->  NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        return managedContext
    }
    
    
    
}
