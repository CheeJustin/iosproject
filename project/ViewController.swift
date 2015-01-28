//
//  ViewController.swift
//  project
//
//  Created by ctrlaltbelieve2 on 2015-01-21.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var courses = groupManager.groups;

	override func viewDidLoad()
    {
        super.viewDidLoad();
		// Do any additional setup after loading the view, typically from a nib.
	}
    
	override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning();
		// Dispose of any resources that can be recreated.
    }
    
    @IBAction func addRecipient(sender: AnyObject)
    {
        /*
        var alert = UIAlertView();
        alert.title = "Add To Announcement";
        alert.message = "List of courses";
        alert.addButtonWithTitle("Test");
        alert.addButtonWithTitle("Test2");
        alert.addButtonWithTitle("Moo");
        alert.show();
        */
        
        ////////////////////
        
        /*
        var alert = UIAlertController(title: "Add Recipient", message: "", preferredStyle: UIAlertControllerStyle.Alert);
        
        for course in courses
        {
            var action = UIAlertAction(title: course, style: UIAlertActionStyle.Default, handler: nil);
            alert.addAction(action);
        }
        
        presentViewController(alert, animated: true, completion: nil);
        */
        
        //////////////////
        
        /* C#...
        var alert = UIAlertController(title: "Add Recipient", message: "", preferredStyle: UIAlertControllerStyle.Alert);
        
        var recipients = UITableView();
        recipients.delegate = self;
        recipients.dataSource = self;
        */
        
        //////////////////
        
    }


}

