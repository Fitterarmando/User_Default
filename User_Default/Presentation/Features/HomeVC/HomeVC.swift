//
//  ViewController.swift
//  User_Default
//
//  Created by Juan Armando Frías Ramírez on 01/12/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private let kMykey = "MY_KEY"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    //Recuperamos preferencias
    @IBAction func getButtonAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: kMykey){
            showAlert(message: value)
        } else {
            showAlert(message: "No hay un valor para esta clave")
            
        }
        
    }
    //Guarda preferencias
    @IBAction func putButtonAction(_ sender: Any) {
        UserDefaults.standard.set("ARMANDO", forKey: kMykey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
    }
    // Borra preferencias
    @IBAction func deleteButtonAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: kMykey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
}

