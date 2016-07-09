//
//  owner.swift
//  assignment
//
//  Created by Kittidech Vongsak on 7/8/16.
//  Copyright © 2016 Kittidech Vongsak. All rights reserved.
//

import UIKit
import SwiftyJSON

class Owner: NSObject {
    
    var login: String?
    var id: UInt?
    var avatar_url: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var gists_url: String?
    var starred_url: String?
    var subscriptions_url: String?
    
    init(json:JSON) {
        self.login = json["owner"]["login"].stringValue
        self.id = json["owner"]["id"].uInt!
        self.avatar_url = json["owner"]["avatar_url"].stringValue
        self.url = json["owner"]["url"].stringValue
        self.html_url = json["owner"]["html_url"].stringValue
        self.followers_url = json["owner"]["followers_url"].stringValue
        self.gists_url = json["owner"]["gists_url"].stringValue
        self.starred_url = json["owner"]["starred_url"].stringValue
        self.subscriptions_url = json["owner"]["subscriptions_url"].stringValue
        
    }
}
