//
//  addTableViewController.swift
//  EcoWin
//
//  Created by Nehul Yadav on 7/16/16.
//  Copyright (c) 2016 Nehul Yadav. All rights reserved.
//

import UIKit

class addTableViewController: UITableViewController, UITextFieldDelegate{
    
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        actions.append(textField.text!)
        textField.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(actions, forKey: "list")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            self.view.enableEditing(true)
        }
        super.touchesBegan(touches, withEvent:event)
    }
    
    func textFieldShouldReturn (textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
