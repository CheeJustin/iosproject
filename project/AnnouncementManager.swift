//
//  AnnouncementManager.swift
//  project
//
//  Created by Justin Chee on 2015-01-24.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

var announcementManager = AnnouncementManager();
var announcementManager2 = AnnouncementManager();

var announcements_DEFAULT = ["Classes Cancelled", "Quiz next week!", "New office hours", "Marks lost", "Assignment 2 is out!", "IT help", "Disregard the previous announcement", "Sick today", "Nvm, not sick"];

var announcements_DEFAULT2 = ["Announcements 2", "More announcements 2", "Stuff", "BCIT", "Direct", "Student", "Messaging", "Acronym"];


struct Announcement
{
    var title: String;
    var description: String;
}

class AnnouncementManager: NSObject
{
 
    var announcements = [Announcement]();
    
    var isPopulated: Bool = false;
    
    func addAnnouncement(title: String, description: String = "I am description")
    {
        announcements.append(Announcement(title: title, description: description));
    }
    
    func populate()
    {
        if !isPopulated
        {
            for announcement in announcements_DEFAULT
            {
                addAnnouncement(announcement);
            }
    
            isPopulated = true;
        }
    }
    
    func populate2()
    {
        if !isPopulated
        {
            for announcement in announcements_DEFAULT2
            {
                addAnnouncement(announcement);
            }
            
            isPopulated = true;
        }
    }
    
}
