//
//  UserBD.swift
//  UserApp
//
//  Created by Sergio on 13/11/22.
//

import Foundation
import CoreData


class UserDB {
    
    static let entityName = "User"
    
    
    /**
     Funcion que crea y retorna un registro sobre la entidad de "Usuario", almacena en coreData
     - Author: spinilla
     */
    static func initUser (context:NSManagedObjectContext ) -> User {
        
        let entity = NSEntityDescription.entity(forEntityName: entityName,in:context )!
        return User(entity: entity, insertInto: context)
    }
    
    
    /**
     Funcion que nos permite consultar una objeto de la entidad "Usuario" de la base de datos local
     - Author: spinilla
     */
    static func userById (context:NSManagedObjectContext,id:Int ) -> User? {
        
        let peticion = NSFetchRequest<User>(entityName: entityName)
        peticion.predicate = NSPredicate(format: "id == %i",id)
        
        do {
            if try context.count(for: peticion) == 0 {
                return nil
            }else{
                return try context.fetch(peticion).first!
            }
        }catch{
            return nil
        }
        
    }
    
    /**
     Funcion que nos permite consultar la lista de objetos "Usuario" de la base de datos local
     - Author: spinilla
     */
    static func allUser (context:NSManagedObjectContext ) -> [User]? {
        
        let peticion = NSFetchRequest<User>(entityName: entityName)
        
        do{
            if try context.count(for: peticion) == 0 {
                return nil
            }else{
                return try context.fetch(peticion)
            }
            
        }catch {
            return nil
        }
        
    }
    
}
