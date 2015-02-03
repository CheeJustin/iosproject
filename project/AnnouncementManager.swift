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
var curAnnouncement = Announcement(title: "No Title", description: "No Description");

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
            // For testing purposes
            announcements[0].description = "I will be late to class today as I had a terrible dream.\n\nThe dream involved a missing umbrella and a dreadful downpour that brought chills to the very soul. The very thought of this vision deteriorates me faith in humanity, as such, I will be staying home and eating some chicken noodle soup to ease the pain.\n\nSee you guys next week!";
            announcements[1].description = "Remember that there's a quix next week! It's work 72% of your marks so don't be late...\nYou know who you are.\n\nXOXO\n\nPerson";
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
