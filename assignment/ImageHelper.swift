//
//  ImageHelper.swift
//  assignment
//
//  Created by Kittidech Vongsak on 7/9/16.
//  Copyright © 2016 Kittidech Vongsak. All rights reserved.
//

import UIKit

class ImageHelper: NSObject {
    static func loadImageFromUrl(url: String, view: UIImageView){
        
        // Create Url from string
        let url = NSURL(string: url)!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    view.image = UIImage(data: data)
                })
            }
        }
        
        // Run task
        task.resume()
    }
}
