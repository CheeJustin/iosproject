//
//  Group_Announcement_TableView.swift
//  project
//
//  Created by Justin Chee on 2015-02-02.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Group_Announcement_TableView: UITableViewController
{
    
    var group: Group = Group(id: 0, name: "No name", selected: true, info: "No info", announcements: []);
    var announcements: Array<Announcement> = [];
    let cellID: String = "GroupAnnouncementCell";
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        group = groupManager.getCurControlGroup();
        announcements = group.announcements;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ( announcements.count == 0 ) ? 1 : announcements.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell;
        
        cell.textLabel?.text = ( announcements.count == 0 ) ? "No announcements" : (announcements[indexPath.row].title as String);
        
        cell.textLabel?.textColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0);
        
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
            announcements.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade);
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        curAnnouncement = announcements[indexPath.row];
        
        self.performSegueWithIdentifier("ToAnnouncementView", sender: self);
    }
    

}
