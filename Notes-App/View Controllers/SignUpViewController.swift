//
//  SignUpViewController.swift
//  Notes-App
//
//  Created by Subhronil Saha on 15/11/20.
//

import UIKit
import RealmSwift

class SignUpViewController: UIViewController {

    @IBOutlet var nameField : UITextField?
    @IBOutlet var emailField : UITextField?
    @IBOutlet var mobileField : UITextField?
    @IBOutlet var passwordField : UITextField?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Field Validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //MARK:- Sign Up Button
    @IBAction func signUpButton() {
        
        if let email = emailField?.text {
            print(isValidEmail(email))
            if !isValidEmail(email) { return }
        }
        
        realm.beginWrite()

        let user = User()
        
        if let email = emailField?.text, let mobile = mobileField?.text, let name = nameField?.text, let password = passwordField?.text {
            user.email = email
            user.mobile = mobile
            user.name = name
            user.password = password
        } else { return }
        
        realm.add(user)
        
        try! realm.commitWrite()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    //MARK:- Login Button
    @IBAction func loginButton() {
        navigationController?.popViewController(animated: true)
    }

}
