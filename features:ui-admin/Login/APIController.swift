//
//  APIController.swift
//  iMuzik
//
//  Created by Shah on 1/26/15.
//  Copyright (c) 2015 COMP4977. All rights reserved.
//

import Foundation

protocol APIControllerProtocol
{
    func didReceiveAPIResults(results: NSDictionary)
}

class APIController
{
    //Delegate as per iOS conventions
    var delegate: APIControllerProtocol
    
    //Init as per iOS conventions
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    //Calls the iTunes API and recieves a JSON of product data
    func searchItunesFor( searchTerm: String )
    {
        //iTunes API needs terms separated by + symbols
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        
        //Escape anything else htat isn't URL-freindly
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        {
            let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=music"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                println("Task completed")
                
                if(error != nil)
                {
                    // If there is an error in the web request, print it to the console
                    println(error.localizedDescription)
                }
                
                var err: NSError?
                
                
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
                if(err != nil)
                {
                    
                    // If there is an error parsing JSON, print it to the console
                    println("JSON Error \(err!.localizedDescription)")
                }
                
                let results: NSArray = jsonResult["results"] as NSArray
                self.delegate.didReceiveAPIResults(jsonResult)
                
            })
            
            task.resume()
        }
    }
}
