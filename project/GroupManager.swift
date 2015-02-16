//
//  GroupManager.swift
//  project
//
//  Created by Justin Chee on 2015-01-24.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

var groupManager = GroupManager();
var curGroup = Group(id: 0, name: "No name", selected: true, info: "No info", announcements: []);
var curGroupIndex = -1;

var controls_DEFAULT = ["BLAW3600 Computers and the Law 4R", "BLAW3600 Computers and the Law 4X", "BLAW3600 Computers and the Law 4Y", "BLAW3600 Computers and the Law 4Z", "BLAW1100 The Law and Society 4A", "BLAW1100 The Law and Society 4B", "BLAW3600 The Law and Society 4C", "BLAW3600 The Law and Society 4D", "BLAW2235 Fun with the Law 2G", "BLAW1200 Suit up by Lawyering up 1F", "BLAW1200 Suit up by Lawyering up 1S"];
var views_DEFAULT = ["CST 4 Ever", "COMP 4R", "CST Grads of Spring 2015", "Tomorrow's Masters of Digital Media", "iOS Term Project"];


struct Group
{
    var id: Int; // As unique identifier
    var name: String;
    var selected: Bool;
    var info: String;
    var announcements: Array<Announcement> = [Announcement]();
}

class GroupManager: NSObject
{
    
    var controls = [Group]();
    var joins = [Group]();
    
    var isPopulated: Bool = false;
    var id = 0;
    
    func addControl(id: Int, name: String, selected: Bool = false, info: String = "I am info")
    {
        controls.append(Group(id: id, name: name, selected: selected, info: info, announcements: []));
    }
    
    func addView(id: Int, name: String, selected: Bool = false, info: String = "I am info")
    {
        joins.append(Group(id: id, name: name, selected: selected, info: info, announcements: []));
    }
    
    func populate()
    {
        if !isPopulated
        {
            for group in controls_DEFAULT
            {
                addControl(id++, name: group);
            }
            for group in views_DEFAULT
            {
                addView(id++, name: group);
            }
            
            isPopulated = true;
            
            // For testing purposes only.
            announcementManager.populate();
            announcementManager2.populate2();
            announcementManager3.populate3();
            controls[0].announcements = announcementManager.announcements;
            controls[1].announcements = announcementManager2.announcements;
            
            joins[0].announcements = announcementManager3.announcements;
            joins[1].announcements = announcementManager.announcements;
        }
    }
    
    func toggleSelect(index: Int)
    {
        controls[index].selected = !controls[index].selected;
    }
    
    func getCurControlGroup() -> Group
    {
        for group in controls
        {
            if group.selected
            {
                return group;
            }
        }
        return Group(id: 0, name: "No name", selected: true, info: "No info", announcements: []);
    }
    
    
    func getCurJoinedGroup() -> Group
    {
        for group in joins
        {
            if group.selected
            {
                return group;
            }
        }
        return Group(id: 0, name: "No name", selected: true, info: "No info", announcements: []);
    }
    
    func getCurControlGroupIndex() -> Int
    {
        for i in 0...controls.count - 1
        {
            if controls[i].selected
            {
                return i;
            }
        }
        // Cause an error
        return -42;
    }
    
    // Deselects all control groups
    func deselectAllControls() -> Void
    {
        for i in 0...controls.count - 1
        {
            controls[i].selected = false;
        }
    }
    
}
