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
    
    var courses = groupManager.controls;

	override func viewDidLoad()
    {
        super.viewDidLoad();
		// Do any additional setup after loading the view, typically from a nib.
        
	}

    @IBAction func back(sender: AnyObject)
    {
        // Dismisses current view
        println("CLICKED");
        dismissViewControllerAnimated(true, completion: nil);
    }

}

