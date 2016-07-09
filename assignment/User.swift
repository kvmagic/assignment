//
//  User.swift
//  assignment
//
//  Created by Kittidech Vongsak on 7/8/16.
//  Copyright © 2016 Kittidech Vongsak. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: NSObject {
    var id: UInt?
    var full_name: String?
    var html_url: String?
    var fork: Bool?
    var url: String?
    var forks_url: String?
    var default_branch: String?
    var owner : Owner?
    
    init(json:JSON) {
        self.id = json["id"].uInt!
        self.full_name = json["full_name"].stringValue
        self.html_url = json["html_url"].stringValue
        self.fork = json["fork"].bool!
        self.url = json["url"].stringValue
        self.forks_url = json["forks_url"].stringValue
        self.default_branch = json["default_branch"].stringValue
        self.owner = Owner(json: json)
        
        
    }
}
