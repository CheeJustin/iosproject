//
//  ToRecipientView.swift
//  project
//
//  Created by Justin Chee on 2015-01-26.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class ToRecipientView: UIViewController
{
    
    let cellID: String = "GroupSelectCell";
    var curGroupIndex: Int = -1;
    var curGroupName: String = "";
    
    @IBOutlet weak var textRecipient: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadCompose:", name: "reload", object: nil);
        curGroupIndex = groupManager.getCurControlGroupIndex();
        curGroupName = groupManager.controls[curGroupIndex].name;
        populateTextView();
    }
    
    func populateTextView()
    {
        groupManager.populate();
    
        var string = curGroupName;
    
        for group in groupManager.controls
        {
            // Change group.name != curGroupName for cases with groups having the same name <----
            if group.selected && group.name != curGroupName
            {
                string += ", -" + truncateName(group.name);
            }
        }
        textRecipient.text = string;
    
        /*  Procedurally making a button
            WIP for recipients
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
        
        /*  Gets course number and set number ex. 3600 - 4R
            Removed bcause it does not apply for "Custom Groups"
        var i = numChar - 2;
        
        if countElements(name) > 8
        {
        var z = advance(name.startIndex, i);
        var x = advance(name.startIndex, 4);
        var y = advance(name.startIndex, 8);
        
        var newName = name.substringWithRange(Range<String.Index>(start: x, end: y))
        newName += " - " + name.substringFromIndex(z);
        
        name = newName;
        }
        */
    }
    
}
