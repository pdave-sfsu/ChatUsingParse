//
//  LoginViewController.swift
//  ChatUsingParse
//
//  Created by Poojan Dave on 2/21/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonPushed(_ sender: Any) {
        
        signUp();
        
    }
    
    func signUp() {
        let user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text

        // other fields can be set just like with PFObject
   
        user.signUpInBackground { (success: Bool, error: Error?) in
            
            if success {
                print("This worked!")
            } else {
                print("This did not work")
            }
            
        }
        
    }
    
    @IBAction func loginButtonPushed(_ sender: Any) {
        
        login();
        
    }
    
    func login() {
        
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("User logged in")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
