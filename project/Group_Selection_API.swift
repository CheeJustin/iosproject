//
//  Group_Selection_API.swift
//  project
//
//  Created by Justin Chee on 2015-02-17.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Group_Selection_API: UITableViewController
{
    
    var groups: [Album] = [];
    var curGroup: Int = -1;
    let cellID: String = "GroupSelectCell";
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        groups = curAlbums;
        //curGroup = groupManager.getCurControlGroupIndex();
        
        self.tableView.layer.cornerRadius = 3;
        self.tableView.layer.masksToBounds = true;
        self.tableView.clipsToBounds = true;
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
        cell.textLabel?.text = (group.title as String);
        
        if group.title == curAlbum.title
        {
            groups[indexPath.row].selected = true;
        }
        
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
        if curAlbums[indexPath.row].title != curAlbum.title
        {
            groups[indexPath.row].selected = !groups[indexPath.row].selected;
            //curAlbums[indexPath.row].selected = !curAlbums[indexPath.row].selected;
            //groupManager.toggleSelect(indexPath.row);
            
            // Turns off selection properties to show accessory.
            tableView.deselectRowAtIndexPath(indexPath, animated: false);
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None);
        }
    }
    
    @IBAction func addRecipient(sender: AnyObject)
    {
        // Refreshes previous page
        NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil);
        // Dismisses current view
        dismissViewControllerAnimated(true, completion: nil);
    }
}
