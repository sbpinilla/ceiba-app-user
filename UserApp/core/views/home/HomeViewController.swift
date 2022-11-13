//
//  HomeViewController.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import UIKit


/**
 Controlador de la vista Home disponible en Main.storyboard
 - Author: spinilla
 */
class HomeViewController: UIViewController {
    
    var viewLoader:LoadingViewController?
    private var userViewModel = UserViewModel()
    private var listUser: [UserDTO] = []
    private var listUserTem: [UserDTO] = []
    var contextCoreData = Utils.getManagedContext()
    
    @IBOutlet weak var tblUser: UITableView!
    @IBOutlet weak var edtSearch: UITextField!
    @IBOutlet weak var contenedorErrores: UIView!
    
    
    /**
     Metodo que se ejecuta antes que la interfaz se presente al usuario,es usado como inicializador
     - Author: spinilla
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
        initViewModels()
        initViews()
        // Do any additional setup after loading the view.
    }
    
    
    /**
     Metodo que se ejecuta cuando la interfaz grafica ya se presento al usuario
     - Author: spinilla
     */
    override func viewDidAppear(_ animated: Bool) {
        initNavigationBar()
    
        present(viewLoader!, animated: true, completion: {
            
            let userByLocal = self.userViewModel.getUsersByLocal()
            
            if (userByLocal.isEmpty){
                self.userViewModel.getUsersServer()
            }else{
                
                self.reloadUserData(userDtoList: userByLocal)
            }
            
             
             
         })
        
    }
        
    
    /**
     Metodo usado para inicializar los controles de la interfaz
     - Author: spinilla
     */
    func initViews(){
        
        title = "Usuarios"
        
        edtSearch.placeholderColor(UIColor(named: ColorsUtils.colorText)!)
        edtSearch.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        listUserTem = listUser.map{$0}
        tblUser.reloadData()
        viewLoader = Utils.showLoadView()
        
    }
    
    /**
     Metodo usado para inicializar los viewModel implementados en la interfaz
     - Author: spinilla
     */
    func initViewModels(){
        
        userViewModel.getUsers = { response in
            
            self.reloadUserData(userDtoList: response)
        }
        
        userViewModel.showErrors = {message in
            // no implementado
        }
        
        
    }
    
    /**
     Evento de escritura sobre los campos de entrada de texto buscar
     - Author: spinilla
     */
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        textField.text = textField.text!.components(separatedBy: CharacterSet.symbols).joined()
        
        
        
        if textField.text!.count == 1 {
            textField.text = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        if (edtSearch.text!.count >= 1){
            
            
            listUser = listUserTem.map{ $0 }
            
            let listaFiltrada = listUser.filter { (user) -> Bool in
                user.name!.uppercased().contains(edtSearch.text!.uppercased())
            }
            
            listUser = listaFiltrada
            validarNumeroRegistros()
            tblUser.reloadData()
            
        }else{
            listUser = listUserTem.map{ $0 }
            validarNumeroRegistros()
            tblUser.reloadData()
        }
        
        
        
        
    }
    
    
    /**
     Metodo encargado de validar el numero de registros, si no hay se presentara la vista de "No hay resultados"
     - Author: spinilla
     */
    func validarNumeroRegistros(){
        
        if(listUser.count == 0){
            
            contenedorErrores.isHidden = false
            
        }else{
            contenedorErrores.isHidden = true
        }
        
    }
    
    
    func reloadUserData(userDtoList:[UserDTO]){
        
        self.viewLoader!.dismiss(animated: true, completion: {
            self.listUser = userDtoList
            self.listUserTem = self.listUser.map{$0}
            self.tblUser.reloadData()
        })
        
    }
    
}


/**
 Extension de la clase HomeViewController que implementa UITableViewDataSource,UITableViewDelegate
 - Author: spinilla
 */
extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: CeldasId.cellUser.rawValue) as! UserTableViewCell
        
        let data = listUser[indexPath.row]
        
        celda.lblName.text = data.name ?? ""
        celda.lblPhone.text = data.phone ?? ""
        celda.lblMail.text = data.email ?? ""
        
        return celda
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userDTO = listUser[indexPath.row]
        
        
        if #available(iOS 13.0, *) {
            
            if let viewController = storyboard?.instantiateViewController(identifier: VCReferencias.publicationsViewController.rawValue ) as? PublicationsViewController {
                viewController.userDTO = userDTO
                navigationController?.pushViewController(viewController, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    
}



/**
 Extension de la clase HomeViewController que implementa UITextFieldDelegate
 - Author: spinilla
 */
extension HomeViewController: UITextFieldDelegate {
    
    /**
     Metodo que permite esconder el teclado con el boton intro
     - Author: spinilla
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
