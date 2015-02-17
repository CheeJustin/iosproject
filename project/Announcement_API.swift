//
//  Announcement_API.swift
//  project
//
//  Created by Justin Chee on 2015-02-17.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Announcement_API: UIViewController
{
    
    @IBOutlet weak var textViewCompose: UITextView!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.textViewCompose.layer.cornerRadius = 3;
        self.btnRemove.layer.cornerRadius = 3;
        self.btnEdit.layer.cornerRadius = 3;
        self.btnCancel.layer.cornerRadius = 3;
        
        self.navBar.title = curSingle.title;
        self.textViewCompose.text = "Description...\nTrack ID: " + String(curSingle.collectionID) + "\n\netc";
    }
    
    @IBAction func clickCancel(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func clickBack(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil);
    }
}
