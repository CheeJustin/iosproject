//
//  Main_ControlGroup_API.swift
//  project
//
//  Created by Justin Chee on 2015-02-16.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class Main_ControlGroup_API: UITableViewController, APIControllerProtocol
{
    var groups: Array<Group> = [];
    let cellID: String = "GroupControlCell";
    
    
    //iTunes API var
    
    var tableData = []
    var albums = [Album]()
    
    //Dictionary for caching images
    var imageCache = [String : UIImage]()
    
    //APIController instance
    var api : APIController?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        groupManager.populate();
        groups = groupManager.controls;
        
        self.tableView.layer.cornerRadius = 3;
        self.tableView.layer.masksToBounds = true;
        self.tableView.clipsToBounds = true;
        
        api = APIController(delegate: self)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        api!.searchItunesFor("Taylor Swift")
        //api!.searchItunesForSingles("275621626")
    }
    
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            TipInCellAnimator.animate(cell)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return albums.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        /*
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell;
        let group = groups[indexPath.row];
        cell.textLabel?.text = (group.name as String);
        cell.textLabel?.textColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0);
        
        return cell;
        */
        
        
        
        //let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
        
        let album = self.albums[indexPath.row]
        cell.textLabel?.text = album.title
        cell.imageView?.image = UIImage(named: "Blank52")
        
        // Get the formatted price string for display in the subtitle
        let formattedPrice = album.price
        
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
        
        if (self.albums[indexPath.row].selected)
        {
            cell.detailTextLabel?.numberOfLines = 7;
            cell.detailTextLabel?.text = formattedPrice + "\nTaylor Swift's number one hit, ravaging the world by storm. Get in on this swiftly, or be left out.\n"
        }
        else
        {
            cell.detailTextLabel?.text = formattedPrice
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //curAlbumID = albums[indexPath.row].collectionID;
        curAlbum = albums[indexPath.row];
        println(curAlbum.collectionID);
        
        self.performSegueWithIdentifier("ToGroupView", sender: self);
    }
    
    
    func didReceiveAPIResults(results: NSDictionary)
    {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.albums = Album.albumsWithJSON(resultsArr)
            curAlbums = self.albums
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    
}
