//
//  LoginSignupViewController.swift
//  PensandoClassBooker
//
//  Created by 黄佳钰 on 2020/5/27.
//  Copyright © 2020 Jiayu Huang. All rights reserved.
// https://www.appcoda.com.tw/firebase-login-signup/
// https://www.raywenderlich.com/3-firebase-tutorial-getting-started

import UIKit
import Firebase
import FirebaseAuth

class LoginSignupViewController: UIViewController {

    let homeSegue = "homeSegue"

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.systemTeal

        // Do any additional setup after loading the view.
    }

    @IBAction func loginDidTouch(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)

                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)

                self.present(alertController, animated: true, completion: nil)

        } else {
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in

                if error == nil {
                    self.performSegue(withIdentifier: self.homeSegue, sender: nil)

                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)

                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                               alertController.addAction(defaultAction)

                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }


    @IBAction func signupDidTouch(_ sender: Any) {
        let alert = UIAlertController(title: "Register", message: "Please redister a new account with your email address.", preferredStyle: .alert)

        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            if emailField.text == "" {
                let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)

                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)

                self.present(alertController, animated: true, completion: nil)

            } else {
                Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                    if error == nil {
                        print("You have successfully signed up")
                        //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                        self.performSegue(withIdentifier: self.homeSegue, sender: nil)
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)

                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)

                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default)

        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email..."
        }

        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password..."
        }

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
    }
}

//extension LoginSignupViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == emailTextField {
//            passwordTextField.becomeFirstResponder()
//        }
//        if textField == passwordTextField {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
//}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

