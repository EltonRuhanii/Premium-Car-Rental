//
//  LoginViewController.swift
//  HomeScreen
//
//  Created by WIZZARDI on 29.9.22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: PROPERTIES
    // OUTLETS
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    // VARIABLES
    let userDefaults = UserDefaults()
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        
    }
}

// MARK: FUNCTIONS
extension LoginViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.usernameTextfield.resignFirstResponder()
        self.passwordTextfield.resignFirstResponder()
        return true
    }
    
    // Sign In Button Pressed
    @IBAction func signInButtonPressed(_ sender: Any) {
        if let textEmail = self.usernameTextfield.text, textEmail.isEmpty {
                return
            } else if let textPassword = self.passwordTextfield.text, textPassword.isEmpty{
                let alert = UIAlertController(title: "Check password", message: "Password is either wrong or empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                }))
                present(alert, animated: true)
            }
//            let name = self.usernameTextfield.text
            userDefaults.setValue(self.usernameTextfield.text, forKey: "name")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewcontroller = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
//                viewcontroller.name = name ?? ""
                self.navigationController?.pushViewController(viewcontroller, animated: false)
            }
    }
    
    @IBAction func guestButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            viewcontroller.name = "Guest"
            self.navigationController?.pushViewController(viewcontroller, animated: false)
            }
    }
}
