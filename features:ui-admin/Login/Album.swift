//
//  Album.swift
//  iMuzik
//
//  Created by Shah on 1/26/15.
//  Copyright (c) 2015 COMP4977. All rights reserved.
//

import Foundation

var curAlbum: Album = Album(name: "", price: "", thumbnailImageURL: "", largeImageURL: "", itemURL: "", artistURL: "", collectionID: -666, artist: "")
var curSingle: Album = Album(name: "", price: "", thumbnailImageURL: "", largeImageURL: "", itemURL: "", artistURL: "", collectionID: -666, artist: "")
var curAlbums: [Album] = []
var curAlbumSingles: [Album] = []

class Album
{
    var title: String
    var price: String
    var thumbnailImageURL: String
    var largeImageURL: String
    var itemURL: String
    var artistURL: String
    var collectionID: Int
    var artist: String
    var selected: Bool
    
    init(name: String, price: String, thumbnailImageURL: String, largeImageURL: String, itemURL: String, artistURL: String, collectionID : Int, artist: String )
    {
        self.title = name
        self.price = price
        self.thumbnailImageURL = thumbnailImageURL
        self.largeImageURL = largeImageURL
        self.itemURL = itemURL
        self.artistURL = artistURL
        self.collectionID = collectionID
        self.artist = artist
        self.selected = false
    }
    
    class func albumsWithJSON(allResults: NSArray) -> [Album] {
        
        // Create an empty array of Albums to append to from this list
        var albums = [Album]()
        
        // Store the results in our table data array
        if allResults.count>0 {
            
            // Sometimes iTunes returns a collection, not a track, so we check both for the 'name'
            for result in allResults {
                
                var name = result["trackName"] as? String
                if  name == nil {
                    name = result["collectionName"] as? String
                }
                
                // Sometimes price comes in as formattedPrice, sometimes as collectionPrice.. and sometimes it's a float instead of a string. Hooray!
                var price = result["formattedPrice"] as? String
                if price == nil {
                    price = result["collectionPrice"] as? String
                    if price == nil {
                        var priceFloat: Float? = result["collectionPrice"] as? Float
                        var nf: NSNumberFormatter = NSNumberFormatter()
                        nf.maximumFractionDigits = 2
                        if priceFloat != nil {
                            price = "$"+nf.stringFromNumber(priceFloat!)!
                        }
                    }
                }
                
                let thumbnailURL = result["artworkUrl60"] as? String ?? ""
                let imageURL = result["artworkUrl100"] as? String ?? ""
                let artistURL = result["artistViewUrl"] as? String ?? ""
                
                var itemURL = result["collectionViewUrl"] as? String
                if itemURL == nil {
                    itemURL = result["trackViewUrl"] as? String
                }
                
                var collectionID = result["trackId"] as? Int
                if collectionID == nil {
                    collectionID = result["collectionId"] as? Int
                }
                
                if price == nil {
                    print("price " + name!)
                    price = "$0.01"
                }
                
                let artist = result["artistName"] as? String
                
                
                var newAlbum = Album(name: name!, price: price!, thumbnailImageURL: thumbnailURL, largeImageURL: imageURL, itemURL: itemURL!, artistURL: artistURL, collectionID: collectionID!, artist: artist!)
                albums.append(newAlbum)
            }
        }
        return albums
    }
}