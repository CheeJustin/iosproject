//
//  GroupManager.swift
//  project
//
//  Created by Justin Chee on 2015-01-24.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

var groupManager = GroupManager();

var groupss = ["BLAW3600 Computers and the Law 4R", "BLAW3600 Computers and the Law 4X", "BLAW3600 Computers and the Law 4Y", "BLAW3600 Computers and the Law 4Z", "BLAW1100 The Law and Society 4A", "BLAW1100 The Law and Society 4B", "BLAW3600 The Law and Society 4C", "BLAW3600 The Law and Society 4D", "BLAW2235 Fun with the Law 2G", "BLAW1200 Suit up by Lawyering up 1F", "BLAW1200 Suit up by Lawyering up 1S"];

struct Group
{
    var name: String;
    var selected: Bool;
    var info: String;
}

class GroupManager: NSObject {
    
    var groups = [Group]();
    var isPopulated: Bool = false;
    
    func addGroup(name: String, selected: Bool = false, info: String = "I am info")
    {
        groups.append(Group(name: name, selected: selected, info: info));
    }
    
    func populate()
    {
        if !isPopulated
        {
            for group in groupss
            {
                addGroup(group);
            }
            isPopulated = true;
        }
    }
    
    func toggleSelect(index: Int)
    {
        groups[index].selected = !groups[index].selected;
    }
    
}
