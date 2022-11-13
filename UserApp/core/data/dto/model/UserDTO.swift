//
//  UserDTO.swift
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
class UserDTO:Mappable {
    
    var id:Int?
    var name:String?
    var email:String?
    var phone:String?
    
    required public init?(map: Map) {
        // no implementado
    }
    
    
    func mapping(map: Map) {
        id      <- map["id"]
        name    <- map["name"]
        email   <- map["email"]
        phone   <- map["phone"]
    
    }
    
    
}


