//
//  PostsDTO.swift
//  UserApp
//
//  Created by Sergio pinilla on 12/11/22.
//

import Foundation
import ObjectMapper

/**
Clase que modela los datos del usuario
- Author: spinilla
*/
class PostDTO:Mappable {
    
    var id:Int?
    var userId:Int?
    var title:String?
    var body:String?
    
    required public init?(map: Map) {
        // no implementado
    }
    
    
    func mapping(map: Map) {
        id      <- map["id"]
        userId  <- map["userId"]
        title   <- map["title"]
        body    <- map["body"]
    }
    
    
}
