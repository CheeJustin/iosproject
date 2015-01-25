//
//  AnnouncementTableView.swift
//  project
//
//  Created by Justin Chee on 2015-01-23.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class AnnouncementTableViewOLD: UITableViewController
{

    var groups: Array<Group> = [];
    let cellID: String = "GroupSelectCell";
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        groupManager.populate();
        groups = groupManager.groups;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groups.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell;
        let group = groups[indexPath.row];
        cell.textLabel?.text = (group.name as String);
        
        if group.selected
        {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }
        
        return cell;
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        groups[indexPath.row].selected = !groups[indexPath.row].selected;
        
        // Turns off selection properties to show accessory.
        tableView.deselectRowAtIndexPath(indexPath, animated: false);
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None);
        
    }
    
    @IBAction func addRecipient(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil);
    }
}
