//
//  LoginViewController.swift
//  Notes-App
//
//  Created by Subhronil Saha on 15/11/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    var callback : ((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped() {
        callback?(true)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButton() {
        let signUpVC = storyboard?.instantiateViewController(identifier: "signUpViewController") as! SignUpViewController
        signUpVC.navigationItem.title = "Sign Up"
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    

}
