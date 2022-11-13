//
//  UserViewModel.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import Foundation
import UIKit
import Alamofire
import RxSwift
import RxAlamofire


/**
 Clase que expone las funcionalidades del modulo de Autenticacion a las interfaces graficas
 - Author: spinilla
 */
class UserViewModel{
    
   
    lazy var userVM:UserViewModel?  = UserViewModel()
    var showErrors: ((_ message :String) -> ())?
    var getUsers: ((_ response:[UserDTO]) -> ())?
    
    var getPostSuccess: ((_ response:[PostDTO]) -> ())?
    
}


/**
 Extension de la clase AuthViewModel
 - Author: spinilla
 */
extension UserViewModel {
    
    func getUsersByLocal() -> [UserDTO]{
        
        let userDB = UserDB.allUser(context: Utils.getManagedContext())
        
        print("Datos \(userDB?.count ?? 0)")
        
        if userDB == nil || userDB!.isEmpty{
            return []
        }
        
        let dataList =  userDB.map { (userList) -> [UserDTO] in
            
        userList.map{user in
                let userDTO =  UserDTO(map: UserInteractor.map)
                userDTO?.id =  Int(user.id )
                userDTO?.name = user.name
                userDTO?.phone = user.phone
                userDTO?.email = user.email
                
                return userDTO!
            }
            
            
        }
        
        
        
        return dataList ?? []

    }
    
    
    func getPostByUsersIdLocal(id:Int) -> [PostDTO]{
        
        let postDB = PostDB.postByUserId(context: Utils.getManagedContext(),id: id)
        
        print("POST Datos \(postDB?.count ?? 0)")
        
        if postDB == nil || postDB!.isEmpty{
            return []
        }
        
        let dataList =  postDB.map { (postList) -> [PostDTO] in
            
            postList.map{ post in
                let postDTO =  PostDTO(map: UserInteractor.map)
                postDTO?.id =  Int(post.id )
                postDTO?.userId =  Int(post.userId )
                postDTO?.title = post.title
                postDTO?.body = post.body
                
                return postDTO!
            }
            
            
        }
        
        
        
        return dataList ?? []

    }
    
    func getUsersServer(){
        
        let onComplete:((_ response:[UserDTO]) -> Void)?  = { (response) in
            
            if !response.isEmpty {
                
                self.getUsers!(response)
                
                response.forEach { userDTO in
                    
                    if (UserDB.userById(context: Utils.getManagedContext(), id: userDTO.id ?? 1) == nil){
                    
                        let userDB = UserDB.initUser(context: Utils.getManagedContext())
                        
                        userDB.id = Int32(userDTO.id ?? 1)
                        userDB.name = userDTO.name
                        userDB.phone = userDTO.phone
                        userDB.email = userDTO.email
                        
                        do{
                            try Utils.getManagedContext().save()
                            
                        }catch{
                            // no implementado
                        }
                        
                        
                    }
                    
            
                }
                
               
                
                
            }else{
                self.showErrors!("Error en al consulta ")
                
            }
            
        }
        
        let _ = UserInteractor.init().getUsers().observeOn(MainScheduler.instance).subscribe(
            onNext: onComplete,
            onError: {(error) in
                self.showErrors!("")
                print("\(error.localizedDescription)")
                //completionHandler(.failure(.conectionError(message: "Error")))
        })
        
        
        
    }
    
    func getPostByUserServer(from id: String){
        
        let onComplete:((_ response:[PostDTO]) -> Void)?  = { (response) in
            
            if !response.isEmpty {
                
                self.getPostSuccess!(response)
                
                response.forEach { postDTO in
                 
                    if (PostDB.PostById(context: Utils.getManagedContext(), id: postDTO.id ?? 1) == nil){
                    
                        let postDB = PostDB.initPost(context: Utils.getManagedContext())
                        
                        postDB.id = Int32(postDTO.id ?? 1)
                        postDB.userId =  Int32(postDTO.userId ?? 1)
                        postDB.body = postDTO.body
                        postDB.title = postDTO.title
                        
                        do{
                            try Utils.getManagedContext().save()
                            
                        }catch{
                            // no implementado
                        }
                        
                        
                    }
                 
                    
                }
                
            }else{
                self.showErrors!("Error en al consulta ")
                
            }
            
        }
        
        let _ = UserInteractor.init().getPostByUser(from: id ).observeOn(MainScheduler.instance).subscribe(
            onNext: onComplete,
            onError: {(error) in
                self.showErrors!("")
                print("\(error.localizedDescription)")
                //completionHandler(.failure(.conectionError(message: "Error")))
        })
        
        
        
    }
    
}
