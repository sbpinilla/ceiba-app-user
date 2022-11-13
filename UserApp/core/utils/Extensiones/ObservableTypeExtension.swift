//
//  ObservableTypeExtension.swift
//  autogestion
//
//  Created by Sergio on 6/02/20.
//  Copyright © 2020 Sergio Pinilla. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

/**
 Extension de la clase ObservableType
 - Author: spinilla
 */
extension ObservableType {
    
    /**
     Funcion que nos permite castear una respuesta del servidor a un objeto generico,
     Implementacion del log de response 
     - Author: spinilla
     */
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        print(type)
        return flatMap { data -> Observable<T> in
            let json = data
          
            guard let object = Mapper<T>().map(JSONObject: json) else {
                throw MappingError.mappingError
            }
          
            
            return Observable.just(object)
        }
    }
    
    /**
     Funcion que nos permite castear una respuesta del servidor a una lista de objetos generico
     - Author: spinilla
     */
    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        print(type)
        return flatMap { data -> Observable<[T]> in
            let json = data
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw MappingError.mappingError
            }
            
            return Observable.just(objects)
        }
    }
}

/**
 Enumaracion de los errores de mapeo para la extension de la clase ObservableType
 - Author: spinilla
 */
enum MappingError: Error {
    case mappingError
}
