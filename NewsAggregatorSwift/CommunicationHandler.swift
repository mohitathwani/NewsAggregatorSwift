//
//  CommunicationHandler.swift
//  NewsAggregatorSwift
//
//  Created by Labs on 8/13/14.
//  Copyright (c) 2014 Tera Mo Labs. All rights reserved.
//

import Foundation

let receviedTopNewsDictionary = "Received Top News Dictionary"
class CommunicationHandler {
    
    class func getDataFromURL(urlString:String) {
        
        let urlRequest = NSURLRequest(URL: NSURL.URLWithString(urlString))
        
        let operationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: operationQueue) { (let response, let data, let error) -> Void in
            
            let dataDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
            
            NSNotificationCenter.defaultCenter().postNotificationName(receviedTopNewsDictionary, object: nil, userInfo: dataDictionary);
        }
        
    }
}