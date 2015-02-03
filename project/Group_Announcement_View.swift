//
//  AnnouncementTableView.swift
//  project
//
//  Created by Justin Chee on 2015-01-23.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Group_Announcement_View: UIViewController, UITableViewDelegate, UITableViewDataSource //UITableViewController
{
 
    var group: Group = Group(id: 0, name: "No name", selected: true, info: "No info", announcements: []);
    var announcements: Array<Announcement> = [];
    let cellID: String = "AnnouncementCell";
    
    @IBOutlet weak var tblAnnouncements: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.tblAnnouncements.layer.cornerRadius = 3;
        self.tblAnnouncements.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.tblAnnouncements.dataSource = self;
        
        // Load appropriate announcements
        //announcementManager.populate();
        //announcements = announcementManager.announcements;
        group = groupManager.getCurControlGroup();
        announcements = group.announcements;
        
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if announcements.count == 0
        {
            return 1;
        }
        return announcements.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tblAnnouncements.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell;
        
        if announcements.count == 0
        {
            cell.textLabel?.text = "There are no announcements.";
        }
        else
        {
            cell.textLabel?.text = (announcements[indexPath.row].title as String);
        }
        
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
            announcements.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade);
        }
        else if editingStyle == .Insert
        {
            // Stuff
        }
    }
    
    
}
