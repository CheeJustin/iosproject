//
//  AnnouncementTableView.swift
//  project
//
//  Created by Justin Chee on 2015-01-23.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class AnnouncementTableView: UIViewController, UITableViewDelegate, UITableViewDataSource //UITableViewController
{

    var myAnnouncements: Array<AnyObject> = ["Classes Cancelled", "Quiz next week!", "New office hours"];
    let cellID: String = "AnnouncementCell";
    
    @IBOutlet weak var tblAnnouncements: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.tblAnnouncements.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.tblAnnouncements.dataSource = self;
		self.tblAnnouncements.backgroundColor = UIColor.grayColor();
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myAnnouncements.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = self.tblAnnouncements.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell;
        
        cell.textLabel?.text = (myAnnouncements[indexPath.row] as String);
		cell.backgroundColor = UIColor.grayColor();
		cell.textLabel?.textColor = UIColor.whiteColor();
        
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
            myAnnouncements.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade);
        }
        else if editingStyle == .Insert
        {
            // Stuff
        }
    }
    
}
