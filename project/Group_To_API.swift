//
//  Group_To_API.swift
//  project
//
//  Created by Justin Chee on 2015-02-17.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Group_To_API: UIViewController
{
    
    let cellID: String = "GroupSelectCell";
    var curGroupIndex: Int = -1;
    var curGroupName: String = "";
    
    
    @IBOutlet weak var textRecipient: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadCompose:", name: "reload", object: nil);
        
        curGroupName = curAlbum.title;
        
        populateTextView();
    }
    
    func populateTextView()
    {
        var string = curGroupName;
        
        for song in curAlbumSingles
        {
            // Change group.name != curGroupName for cases with groups having the same name <----
            if song.selected && song.title != curGroupName
            {
                string += ", -" + truncateName(song.title);
            }
        }
        textRecipient.text = string;
    }
    
    func reloadCompose(notification: NSNotification)
    {
        populateTextView();
    }
    
    func truncateName(name: String) -> String
    {
        var numChar = countElements(name);
        
        var i = numChar - 7;
        
        if countElements(name) > 10
        {
            var i = advance(name.startIndex, numChar - 7);
            return name.substringFromIndex(i);
        }
        
        return name;
    }
    
}
