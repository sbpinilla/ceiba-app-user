//
//  PostDB.swift
//  UserApp
//
//  Created by Sergio pinilla on 13/11/22.
//

import Foundation
import CoreData

class PostDB {
    
    static let entityName = "Post"
    
    
    /**
     Funcion que crea y retorna un registro sobre la entidad de "Publicaciones", almacena en coreData
     - Author: spinilla
     */
    static func initPost (context:NSManagedObjectContext ) -> Post {
        
        let entity = NSEntityDescription.entity(forEntityName: entityName,in:context )!
        return Post(entity: entity, insertInto: context)
    }
    
    
    /**
     Funcion que nos permite consultar una objeto de la entidad "Post" de la base de datos local
     - Author: spinilla
     */
    static func PostById (context:NSManagedObjectContext,id:Int ) -> Post? {
        
        let peticion = NSFetchRequest<Post>(entityName: entityName)
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
     Funcion que nos permite consultar los post por usuario  de la base de datos local
     - Author: spinilla
     */
    static func postByUserId (context:NSManagedObjectContext,id:Int ) -> [Post]? {
        
        let peticion = NSFetchRequest<Post>(entityName: entityName)
        peticion.predicate = NSPredicate(format: "userId == %i",id)
        
        do {
            if try context.count(for: peticion) == 0 {
                return nil
            }else{
                return try context.fetch(peticion)
            }
        }catch{
            return nil
        }
        
    }
    
    /**
     Funcion que nos permite consultar la lista de objetos "Post" de la base de datos local
     - Author: spinilla
     */
    static func allPost (context:NSManagedObjectContext ) -> [Post]? {
        
        let peticion = NSFetchRequest<Post>(entityName: entityName)
        
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
