//
//  ProfileViewController.swift
//  DivisasIosAPP
//
//  Created by Mañanas on 19/9/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


class ProfileViewController: UIViewController {

  
    
   
    
    
    @IBOutlet weak var biographyTextView: UITextView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
       
        fetchUser()
    }
    
    
    
    
    

    
    
    // boton para guardar las modificaciones del usuario
    
    @IBAction func saveProfile(_ sender: Any){
    
        let db = Firestore.firestore()
               
               let userID = Auth.auth().currentUser!.uid
               
               let user = User(id: userID, username: Auth.auth().currentUser!.email!, biography: biographyTextView.text)
               
               
               
               do {
                   try db.collection("Users").document(userID).setData(from: user)
                   print("Perfil actualizado correctamente")
               } catch let error {
                   print("Error writing user to Firestore: \(error)")
               }
        
    }
    
    
    func fetchUser() {
            let db = Firestore.firestore()
            
            let userID = Auth.auth().currentUser!.uid
            
            let docRef = db.collection("Users").document(userID)
            
            Task {
                do {
                    user = try await docRef.getDocument(as: User.self)
                    guard let user = user else {
                        return
                    }
                    biographyTextView.text = user.biography
                } catch {
                    print("Error decoding user: \(error)")
                }
            }
        }
    
  
        
        
        
      
        
    
    //end
}
