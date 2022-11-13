//
//  UserInteractor.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import Foundation
import RxSwift
import RxAlamofire
import ObjectMapper
import Alamofire


/**
 Protocolo que define la implementacion del interactor de usuario
 - Author: spinilla
 */
protocol IUserInteractor {
    
    func getUsers() -> Observable<[UserDTO]>
    
    func getPostByUser(from idUser:String ) -> Observable<[PostDTO]>
}


/**
 Interactor del modulo de usuario,esta clase contiene el intercambio de datos desde el viewModel al repositorio
 - Author: spinilla
 */
class UserInteractor {
    
    static let map = Map(mappingType: .fromJSON, JSON: [:])
}

/**
 Extension del interactor de usuario donde se implementan sus funcionalidades
 - Author: spinilla
 */
extension UserInteractor:IUserInteractor {
    
    func getUsers() -> RxSwift.Observable<[UserDTO]> {
    
        return UserRepository().getUsers()
    }
    
    func getPostByUser(from idUser: String) -> RxSwift.Observable<[PostDTO]> {
    
        return UserRepository().getPostByUser(from: idUser)
        
    }
    
}


