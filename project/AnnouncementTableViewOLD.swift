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

    var myAnnouncements: Array<AnyObject> = [];
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        myAnnouncements = ["Classes Cancelled", "Quiz next week!", "New office hours"];
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myAnnouncements.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cellID: String = "AnnouncementCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell;
        
        cell.textLabel?.text = (myAnnouncements[indexPath.row] as String);
        
        return cell;
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true;
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            myAnnouncements.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade);
        }
        else if editingStyle == .Insert
        {
            // Stuff
        }
    }
    
}
