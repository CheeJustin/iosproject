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
    
    //var courses = groupManager.controls;

    @IBOutlet weak var groupName: UINavigationItem!
    
	override func viewDidLoad()
    {
        super.viewDidLoad();
		
        // Renames the page according to what was selected.
        groupName.title = groupManager.getCurControlGroup().name;
	}

    @IBAction func back(sender: AnyObject)
    {
        // Dismisses current view
        println("CLICKED");
        
        groupManager.deselectAllControls();
        dismissViewControllerAnimated(true, completion: nil);
    }

}

