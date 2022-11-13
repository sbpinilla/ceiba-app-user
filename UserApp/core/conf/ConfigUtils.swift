//
//  ConfigUtils.swift
//  UserApp
//
//  Created by Sergio pinilla on 12/11/22.
//

import Foundation
import Alamofire
import StoreKit



let urlGetUser = "\(getUrlServer())/users"


let urlGetPost = "\(getUrlServer())/posts?userId="



//MARK:- OBTENER DATOS DEL ARCHIVO DE CONFIGURACION

/**
 Metodos que nos permiten obtener la configuracion del archivo .xcconfig
 - Author: spinilla
 */

func getUrlServer() -> String {
    return (Bundle.main.infoDictionary?["URL_SERVER"] as? String)?
        .replacingOccurrences(of: "\\", with: "") ?? ""
}

func getServerTimeOut() -> Double {
    return Double((Bundle.main.infoDictionary?["SERVER_TIME_OUT"] as? String)!)!
    
}

func getIPServer() -> String {
    return (Bundle.main.infoDictionary?["IP_SERVER"] as? String)?
        .replacingOccurrences(of: "\\", with: "") ?? ""
}

func getAppMode() -> String {
    return (Bundle.main.infoDictionary?["APP_MODE"] as? String)?
        .replacingOccurrences(of: "\\", with: "") ?? ""
}


//MARK:- CONFIGURAR TIME OUT ALAMOFIRE

/**
 Configuracion del tiempo de espera (time out) de alamofire
 - Author: spinilla
 */

struct AlamofireManager {
    
    /**
     Configuracion del tiempo de espera (time out) de alamofire
     - Author: spinilla
     */
    static let shared: SessionManager = {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] =
            [getIPServer(): .disableEvaluation]
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = getServerTimeOut()
        
        let sessionManager =
            Alamofire.SessionManager(configuration: configuration,
                                     delegate: SessionDelegate(),
                                     serverTrustPolicyManager:  ServerTrustPolicyManager(policies:serverTrustPolicies))
        return sessionManager
    }()
    
    /**
     Configuracion del tiempo de espera (time out) de alamofire - Espera 3 veces mas del tiempo configurado
     - Author: spinilla
     */
    static let sharedPrioridad: SessionManager = {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] =
            [getIPServer(): .disableEvaluation]
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = getServerTimeOut() * 10
        
        let sessionManager =
            Alamofire.SessionManager(configuration: configuration,
                                     delegate: SessionDelegate(),
                                     serverTrustPolicyManager:  ServerTrustPolicyManager(policies:serverTrustPolicies))
        return sessionManager
    }()
}


//MARK:- Identificador celda
/**
 Enumeracion que contiene los nombres de las celdas usadas en la aplicacion
 - Author: spinilla
 */
enum CeldasId: String{
    
    case cellUser = "itemUser"
    case cellPost = "itemPost"
    
}


enum StoryBoard: String{
    
    case dialogCargando = "DialogCargando"
    
}

//MARK:- Identificacodes view controler
/**
 Enumeracion que contiene los nombres de referencia de las clases en los storyBoard
 - Author: spinilla
 */
enum VCReferencias:String {
    
    case dialogCargando = "LoadingViewController"
    case publicationsViewController = "PublicationsViewController"
}

