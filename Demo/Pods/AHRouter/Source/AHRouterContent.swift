//
//  AHRouterContent.swift
//  AHRouter
//
//  Created by IvanGao on 10/17/17.
//  Copyright © 2017 IvanGao. All rights reserved.
//

import Foundation

@objcMembers
class AHRouterContent: NSObject {
    var urlComponents: URLComponents?
    var urlStr: String?
    var queryDic: [String: String] = [:]
    
    init(_ urlStr: String) {
        super.init()
        self.urlComponents = URLComponents(string: urlStr)
        self.urlStr = urlStr
        self.urlComponents?.queryItems?.forEach {
            self.queryDic[$0.name] = $0.value
        }
    }
}

