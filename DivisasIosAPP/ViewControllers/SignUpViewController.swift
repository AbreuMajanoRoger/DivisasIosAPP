//
//  SignUpViewController.swift
//  DivisasIosAPP
//
//  Created by Mañanas on 17/9/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordTextFieldRepeat: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // Creation User  Function
    
    
    @IBAction func signUp(_ sender: Any) {
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        // metodo Auth para crear un usuario en la base de datos de firebase
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            
            if let error = error {
                print("Error al crear usuario")
                print(error.localizedDescription)
                return
            } else {
                print("Registro correcto")
            }
        }
        
        
    }
        
        
        
    //funcion para volver a la ventana principal 
    
    @IBAction func backToLogin(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
  
    
    
    
    
   // End
}
