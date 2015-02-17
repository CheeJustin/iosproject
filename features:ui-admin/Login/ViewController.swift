//
//  ViewController.swift
//  Login
//
//  Created by ctrlaltbelieve2 on 2015-01-11.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, APIControllerProtocol{

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tvMain: UITableView!
    
    var loggedIn: Bool!
    var username: String!
    
    //iTunes API var
    
    var tableData = []
    var albums = [Album]()
    
    //Dictionary for caching images
    var imageCache = [String : UIImage]()
    
    //Singleton for table cells
    let kCellIdentifier: String = "SearchResultCell"
    
    //APIController instance
    var api : APIController?
    var firstLoad = true;
    //End iTunes API var
    
    var selected = -1;

    override func viewDidLoad() {
        super.viewDidLoad()
		let background = CAGradientLayer().grayColor()
		background.frame = self.view.bounds
		self.view.layer.insertSublayer(background, atIndex: 0)
        
        api = APIController(delegate: self)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        api!.searchItunesFor("Taylor Swift")
		
        // Do any additional setup after loading the view, typically from a nib.
        selected = -1;
        
    }
    
    //Animator
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) 
    {
        if firstLoad
        {
            TipInCellAnimator.animate(cell)
        }
    }

	/** 
	* Handles scene bahaviour
	* If loggedIn flag is false, redirects to login page
	* Else displays customized welcome message
	*/
    override func viewDidAppear(animated: Bool) {
        
        if loggedIn != true
        {
            self.performSegueWithIdentifier("goto_login", sender: self)
        }
        else
        {
            usernameLabel.text = username
        }
    }
	
	// Set loggedIn flag to false and trigger segue to login
    @IBAction func tappedLogout(sender: UIButton) {
		loggedIn = false
        self.performSegueWithIdentifier("goto_login", sender: self)
    }
    
    //iTunes API
    
    func didReceiveAPIResults(results: NSDictionary)
    {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.albums = Album.albumsWithJSON(resultsArr)
            self.tvMain!.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //var detailsViewController: DetailsViewController = segue.destinationViewController as DetailsViewController
        //var albumIndex = tvMain!.indexPathForSelectedRow()!.row
        //var selectedAlbum = self.albums[albumIndex]
        //detailsViewController.album = selectedAlbum
    }
    
    //Describes the layout of the tableView
    func tableView( tableView: UITableView, numberOfRowsInSection section : Int) -> Int
    {
        return albums.count
    }
    
    
    //Describes how to parse the iTunes XML and decorate the tableView
    func tableView( tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        
        //let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: kCellIdentifier)
        
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
        
        if indexPath.row == selected + 1
        {
            firstLoad = true
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (self.albums[indexPath.row].selected)
        {
            return 150
        }
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // Get the row data for the selected row
        var rowData = self.albums[indexPath.row]
        
        var name: String = rowData.title as String
        var formattedPrice: String = rowData.price as String
        
        self.albums[indexPath.row].selected = !self.albums[indexPath.row].selected
        
        /*
        var alert: UIAlertView = UIAlertView()
        alert.title = name
        alert.message = formattedPrice
        alert.addButtonWithTitle("Ok")
        alert.show()
        */
        
        selected = indexPath.row;
        firstLoad = false
        tableView.reloadData()
        
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
        if editingStyle == .Delete
        {
            albums.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade);
        }
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let album = self.albums.removeAtIndex(sourceIndexPath.row)
        self.albums.insert(album, atIndex: destinationIndexPath.row)
    }

}

