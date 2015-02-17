//
//  Group_Info_API.swift
//  project
//
//  Created by Justin Chee on 2015-02-16.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Group_Info_API: UIViewController
{
    @IBOutlet weak var groupInfo: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        groupInfo.text = "Album Info: \n\n" +
            curAlbum.title + "\n" +
            curAlbum.artist + "\n" +
            curAlbum.price
    }
}

