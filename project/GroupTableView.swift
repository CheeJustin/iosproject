//
//  GroupTableView.swift
//  project
//
//  Created by Justin Chee on 2015-01-24.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class GroupTableView: UIViewController, UITableViewDelegate, UITableViewDataSource //UITableViewController
{
    
    let cellID: String = "GroupCell";
    var controlGroups: Array<Group> = [];
    
    @IBOutlet weak var tblGroups: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.tblGroups.layer.cornerRadius = 3;
        self.tblGroups.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.tblGroups.dataSource = self;
        
        // Load the appropriate groups
        groupManager.populate();
        controlGroups = groupManager.groups;
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return controlGroups.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = self.tblGroups.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell;
        
        cell.textLabel?.text = (controlGroups[indexPath.row].name as String);
        
        cell.textLabel?.textColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0);
        cell.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0);
        
        return cell;
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            controlGroups.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade);
        }
        else if editingStyle == .Insert
        {
            // Stuff
        }
    }
    
    
}
