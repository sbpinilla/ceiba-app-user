//
//  UserRepository.swift
//  UserApp
//
//  Created by Sergio pinilla on 12/11/22.
//

import Foundation
import RxSwift
import RxAlamofire
import ObjectMapper
import Alamofire


/**
 Protocolo que define la implementacion del repositorio de usuario
 - Author: spinilla
 */
protocol IUserRepository {
    
    func getUsers() -> Observable<[UserDTO]>
    
    func getPostByUser(from idUser:String ) -> Observable<[PostDTO]>
    
}


/**
 Repositorio del modulo de usuarios ,esta clase contiene los llamados a los servicios asociados con el modulo
 - Author: spinilla
 */
class UserRepository{
    let className = "AuthRepository"
}

/**
 Extension del  repositorio de autenticacion donde se implementan sus funcionalidades
 - Author: spinilla
 */
extension UserRepository:IUserRepository {
    
    func getUsers() -> RxSwift.Observable<[UserDTO]> {
    
        print("className: \(className) - URL: \(urlGetUser)")
        
        return AlamofireManager.shared.rx.json(.get,urlGetUser,
                                               parameters: nil,
                                               encoding: JSONEncoding.default,
                                               headers:nil ).mapArray(type: UserDTO.self)
        
    }
    
    func getPostByUser(from idUser: String) -> RxSwift.Observable<[PostDTO]> {
        
        print("className: \(className) - URL: \(urlGetPost)")
        
        let urlConsumer = "\(urlGetPost)\(idUser)"
        print("urlConsumer: \(urlConsumer)")
        
        return AlamofireManager.shared.rx.json(.get,urlConsumer,
                                               parameters: nil,
                                               encoding: JSONEncoding.default,
                                               headers:nil ).mapArray(type: PostDTO.self)
        
    }
    
}

