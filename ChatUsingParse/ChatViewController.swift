//
//  ChatViewController.swift
//  ChatUsingParse
//
//  Created by Poojan Dave on 2/22/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(_ sender: Any) {
        
        let message = PFObject(className:"Message")
        message["text"] = messageTextField.text!

        message.saveInBackground { (success: Bool, error: Error?) in
            if (success) {
                print(message)
            } else {
                // There was a problem, check error.description
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
