//
//  PublicationsViewController.swift
//  UserApp
//
//  Created by Sergio Pinilla on 12/11/22.
//

import UIKit

class PublicationsViewController: UIViewController {
    
    
    private var listPosts: [PostDTO] = []
    var userDTO: UserDTO? =  nil
    private var userViewModel = UserViewModel()
    var viewLoader:LoadingViewController?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tblPost: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        initViewModels()

        // Do any additional setup after loading the view.
    }
    
    /**
     Metodo que se ejecuta cuando la interfaz grafica ya se presento al usuario
     - Author: spinilla
     */
    override func viewDidAppear(_ animated: Bool) {
        initNavigationBar()
        initBackButtonBar()
        
        getPostByUser()
      
        
        
    }

    /**
     Metodo usado para inicializar los controles de la interfaz
     - Author: spinilla
     */
    func initViews(){
        
        initNavigationBar()
        initBackButtonBar()
        viewLoader = Utils.showLoadView()
        title =  "Post"
        lblName.text =  userDTO?.name
        
        
        
    }
    
    /**
     Metodo usado para inicializar la barra de navegacion
     - Author: spinilla
     */
    func initBackButtonBar(){
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
       
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    /**
     Metodo usado para inicializar los viewModel implementados en la interfaz
     - Author: spinilla
     */
    func initViewModels(){
        
        userViewModel.getPostSuccess = { response in
            
            self.viewLoader!.dismiss(animated: true, completion: {
                
                self.reloadPostData(postList: response)
             
            })
        }
        
        userViewModel.showErrors = {message in
            // no implementado
        }
        
        
    }
    
    /**
     Metodo usado para consultar los post por usuario
     - Author: spinilla
     */
    func getPostByUser(){
        
        present(viewLoader!, animated: true, completion: {
            
            let postLocal = self.userViewModel.getPostByUsersIdLocal(id: self.userDTO?.id ?? 1)
            
            if (postLocal.isEmpty){
                
                self.userViewModel.getPostByUserServer(from: "\(self.userDTO?.id ?? 1)")
            }else{
               
                self.reloadPostData(postList: postLocal)
                
            }
            
         })
        
    }
    
    
    
    func reloadPostData(postList:[PostDTO]){
        
        self.viewLoader!.dismiss(animated: true, completion: {
            self.listPosts = postList
            self.title =  "Post - \(self.listPosts.count)"
            self.tblPost.reloadData()
        })
        
    }
    
    
    
}

extension PublicationsViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: CeldasId.cellPost.rawValue) as! PostTableViewCell
        
        let data = listPosts[indexPath.row]
        
        celda.lblPostName.text = data.title ?? ""
        celda.lblPostText.text = data.body ?? ""
        
        return celda
        
    }
    
    
    
}


