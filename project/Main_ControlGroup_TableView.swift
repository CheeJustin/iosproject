//
//  ControlGroupTableView.swift
//  project
//
//  Created by Justin Chee on 2015-01-27.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Main_ControlGroup_TableView: UITableViewController
{
    var groups: Array<Group> = [];
    let cellID: String = "GroupControlCell";
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        groupManager.populate();
        groups = groupManager.controls;
        
        self.tableView.layer.cornerRadius = 3;
        self.tableView.layer.masksToBounds = true;
        self.tableView.clipsToBounds = true;
    }
    
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            TipInCellAnimator.animate(cell)
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
        cell.textLabel?.textColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0);
        
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        groups[indexPath.row].selected = !groups[indexPath.row].selected;
        groupManager.toggleSelect(indexPath.row);
        
        curGroup = groupManager.getCurControlGroup();
        //curGroupIndex = groupManager.getCurControlGroupIndex();
        
        println(curGroup.name);
        
        //self.performSegueWithIdentifier("ToGroupView", sender: self);
    }

}
