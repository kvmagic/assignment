//
//  Exten.swift
//  assignment
//
//  Created by Kittidech Vongsak on 7/9/16.
//  Copyright © 2016 Kittidech Vongsak. All rights reserved.
//

import UIKit

class Exten {

}

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
}

