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
        
    }
    
    @IBAction func eraseCompose(sender: AnyObject)
    {
        textViewCompose.text = "";
    }
}
