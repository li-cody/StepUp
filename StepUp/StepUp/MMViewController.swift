//
//  MMViewController.swift
//  StepUp
//
//  Created by Cody Li on 8/3/16.
//  Copyright © 2016 Cody Li. All rights reserved.
//

import Foundation
import UIKit

class MMViewController: UITableViewController{
    
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var messageArray : NSMutableArray = ["hey", "good"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Messages"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = messageArray[indexPath.row] as! String
        
        return cell
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue: UIStoryboardSegue) {
        let messageDetailVC = segue.sourceViewController as! AddMessageViewController
        messageArray.addObject(messageDetailVC.message)
        print(messageDetailVC.message)
        self.tableView.reloadData()
    }
    
   
}