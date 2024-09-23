//
//  ViewController.swift
//  DivisasIosAPP
//
//  Created by Mañanas on 13/9/24.
//

// import dependencies

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


class LoginViewController: UIViewController {
    
    // Text Field  email
    @IBOutlet weak var usernameTextField: UITextField!
    
    // Text Field password
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // Login User function
    
    @IBAction func signIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        // funcion para loguear el usuario
        Auth.auth().signIn(withEmail: username, password: password) { authResult, error in
            
            if let error = error {
                print("Error al iniciar sesión")
                print(error.localizedDescription)
                return
            }else {
                print("Login correcto")
                // Funcion para ir a la pagina de inicio
                 self.goToHome()
            }
        }
    }
    
    
    // boton para acceder con el boton de google a la app
    
    @IBAction func googleSignIn(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        //
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        //
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            //
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                print("Error obteniendo el usuario o el token")
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            // autentificar usuario directamente desde un correo de google 
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print("Error al iniciar sesión con Google")
                    print(error.localizedDescription)
                    return
                } else {
                    print("Login correcto con Google")
                    self.goToHome()
                }
            }
        }
    }
    
    
    
    
    func goToHome() {
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    
    
    
    
    
    //end
}









