//
//  tableViewControllerTableViewController.swift
//  EcoWin
//
//  Created by Nehul Yadav on 7/15/16.
//  Copyright (c) 2016 Nehul Yadav. All rights reserved.
//

import UIKit

//var array = [String]()
var actions = ["Took a <5 min shower", "Filled a reusable water bottle", "Filled a reusable coffee mug", "Used a reusable shopping bag", "Took notes with a computer instead of a paper pad"]

class tableViewControllerTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("list") != nil {
            actions = NSUserDefaults.standardUserDefaults().objectForKey("list") as [String]
        }
        
        self.tableView.delegate = self

    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return actions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...insert the special characters using edit > emoji on the menu
        cell.textLabel.text = "❑ " + actions[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // get the cell and text of the tapped row
        let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        let text = cell!.textLabel.text!
        
        // change the cell and text of the tapped row with the new "
        cell!.textLabel.text = "✅" + actions[indexPath.row]
        
        }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }


    override func tableView (tableView : UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            actions.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation : UITableViewRowAnimation.Left)
        }
        
    }
    
    
    
    
    
}
    


