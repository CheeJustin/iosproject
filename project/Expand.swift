//
//  Expand.swift
//  project
//
//  Created by Justin Chee on 2015-02-03.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Expand: UITableViewController
{
    
    let cellIdentifier = "cellIdentifier";
    var tableData = [String]();
    var expanded: Int = 0;

    var curSelectedIndex = -1;
    
    @IBOutlet weak var txtLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        
        // Setup table data
        for index in 0...100
        {
            self.tableData.append("Item \(index)");
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        cell.textLabel?.text = ( curSelectedIndex == indexPath.row ) ? "Selected" : "Not Selected";
        if (curSelectedIndex == indexPath.row)
        {
            cell.detailTextLabel?.text = "Test\n2\n3\n4\n5\n6\nTEST END\n";
            cell.detailTextLabel?.numberOfLines = 7;
            cell.detailTextLabel?.backgroundColor = UIColor.grayColor();
            cell.detailTextLabel?.textColor = UIColor.blueColor();
        }
        else
        {
            cell.detailTextLabel?.text = "";
            cell.detailTextLabel?.numberOfLines = 0;
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if curSelectedIndex == indexPath.row
        {
            return 143.0;
        }
        return 50.0;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if curSelectedIndex == indexPath.row
        {
            curSelectedIndex = -1;
        }
        else
        {
            curSelectedIndex = indexPath.row;
        }
        println(curSelectedIndex);
        self.tableView.reloadData();
    }


}
