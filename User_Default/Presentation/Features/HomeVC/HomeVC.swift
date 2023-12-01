//
//  ViewController.swift
//  User_Default
//
//  Created by Juan Armando Frías Ramírez on 01/12/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private let kMykey = "MY_KEY"
    private let CURRENT_USER_KEY = "current_user"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    //Recuperamos preferencias
    @IBAction func getButtonAction(_ sender: Any) {
       // if let value = UserDefaults.standard.string(forKey: kMykey){
            //showAlert(message: value)
        let currentUser: UserData? = UserDefaults.standard.getObject(forKey: CURRENT_USER_KEY)
        
        if (currentUser != nil) {
            showAlert(message: "ID:\(currentUser!.id) \n NAME:\(currentUser!.name)" )
        } else {
            showAlert(message: "No hay un valor para esta clave")
            
        }
        
    }
    //Guarda preferencias
    @IBAction func putButtonAction(_ sender: Any) {
        var user1 = UserData(id: "1", name: "Armando")
        UserDefaults.standard.saveObject(user1, forKey: CURRENT_USER_KEY)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
        
        /*
        UserDefaults.standard.set("ARMANDO", forKey: kMykey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
         */
    }
    // Borra preferencias
    @IBAction func deleteButtonAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: CURRENT_USER_KEY)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    
    struct UserData: Codable {
        let id : String
        let name : String
    }
    
}

