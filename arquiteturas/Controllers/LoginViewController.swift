//
//  LoginViewController.swift
//  arquiteturas
//
//  Created by Rodrigo Cerqueira Reis on 25/03/25.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            manager.login(email: email, password: password) { userModel in
                self.openHomeView()
            } failureHandler: {error in
                self.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
          }
        }
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func openHomeView() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
    
}
