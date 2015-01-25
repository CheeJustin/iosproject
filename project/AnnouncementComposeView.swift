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
