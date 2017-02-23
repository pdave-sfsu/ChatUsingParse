//
//  ChatViewController.swift
//  ChatUsingParse
//
//  Created by Poojan Dave on 2/22/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var objects: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)

        
        // Do any additional setup after loading the view.
    }
    
    func onTimer () {
        let query = PFQuery(className:"Message")
        query.whereKeyExists("text")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages.")
                // Do something with the found objects
                if let objects = objects {
                    self.objects = objects
                    for object in objects {
                        print(object.objectId!)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }

        }
        
        self.tableView.reloadData()
    
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
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let objects = objects {
            return objects.count
        } else {
            return 0
        }
        
        
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell
        
        let object = objects[indexPath.row]
        
        cell.messageLabel.text = object["text"] as! String?
        
        return cell
        
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
