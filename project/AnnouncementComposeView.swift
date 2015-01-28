//
//  AnnouncementComposeView.swift
//  project
//
//  Created by Justin Chee on 2015-01-23.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class AnnouncementComposeView: UIViewController
{

    @IBOutlet weak var textViewCompose: UITextView!;
    @IBOutlet weak var btnErase: UIButton!;
    @IBOutlet weak var btnSend: UIButton!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.textViewCompose.layer.cornerRadius = 3;
        self.btnErase.layer.cornerRadius = 3;
        self.btnSend.layer.cornerRadius = 3;
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadCompose:", name: "reload", object: nil);
        populateTextView();
    }
    
    func populateTextView()
    {
        groupManager.populate();
        
        var string = "Announcements...\nRecipients: ";
        
        for group in groupManager.groups
        {
            if group.selected
            {
                string += ", " + group.name;
            }
        }
        textViewCompose.text = string;
        
        /*
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton;
        button.frame = CGRectMake(100, 100, 100, 50);
        button.backgroundColor = UIColor.greenColor();
        button.setTitle("Test Button", forState: UIControlState.Normal);
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside);
        
        self.view.addSubview(button);
        
        let button2 = UIButton.buttonWithType(UIButtonType.System) as UIButton;
        button2.frame = CGRectMake(100, 100, 100, 50);
        button2.backgroundColor = UIColor.blueColor();
        button2.setTitle("RAN", forState: UIControlState.Normal);
        button2.addTarget(self, action: "button2Action:", forControlEvents: UIControlEvents.TouchUpInside);
        
        self.view.addSubview(button2);
        */
    }
    
    func reloadCompose(notification: NSNotification)
    {
        populateTextView();
    }
    
    @IBAction func eraseCompose(sender: AnyObject)
    {
        textViewCompose.text = "";
    }
}
