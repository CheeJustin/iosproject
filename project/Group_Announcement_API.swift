//
//  Group_Announcement_API.swift
//  project
//
//  Created by Justin Chee on 2015-02-16.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Group_Announcement_API: UITableViewController, APIControllerProtocol
{
    let cellID: String = "GroupAnnouncementCell";
    
    var tableData = []
    var albums = [Album]()
    
    //Dictionary for caching images
    var imageCache = [String : UIImage]()
    
    //APIController instance
    var api : APIController?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.tableView.layer.cornerRadius = 3;
        self.tableView.layer.masksToBounds = true;
        self.tableView.clipsToBounds = true;
        
        api = APIController(delegate: self)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        api!.searchItunesForSingles(String(curAlbum.collectionID))
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return albums.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
        
        let album = self.albums[indexPath.row]
        cell.textLabel?.text = album.title
        cell.imageView?.image = UIImage(named: "Blank52")
        
        
        // Grab the artworkUrl60 key to get an image URL for the app's thumbnail
        let urlString = album.thumbnailImageURL
        
        // Check our image cache for the existing key. This is just a dictionary of UIImages
        //var image: UIImage? = self.imageCache.valueForKey(urlString) as? UIImage
        var image = self.imageCache[urlString]
        
        
        if( image == nil ) {
            // If the image does not exist, we need to download it
            var imgURL: NSURL = NSURL(string: urlString)!
            
            // Download an NSData representation of the image at the URL
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                if error == nil {
                    image = UIImage(data: data)
                    
                    // Store the image in to our cache
                    self.imageCache[urlString] = image
                    dispatch_async(dispatch_get_main_queue(), {
                        if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                            cellToUpdate.imageView?.image = image
                        }
                    })
                }
                else {
                    println("Error: \(error.localizedDescription)")
                }
            })
            
        }
        else {
            dispatch_async(dispatch_get_main_queue(), {
                if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                    cellToUpdate.imageView?.image = image
                }
            })
        }
        
        cell.detailTextLabel?.text = "Track ID: " + String(album.collectionID)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true;
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            albums.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade);
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        curSingle = curAlbumSingles[indexPath.row]
        self.performSegueWithIdentifier("ToAnnouncementView", sender: self);
    }
    
    
    func didReceiveAPIResults(results: NSDictionary)
    {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.albums = Album.albumsWithJSON(resultsArr)
            curAlbumSingles = self.albums
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    
}
